var mysql = require('mysql');
var config = require('./config.json');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

exports.handler = (event, context, callback) => {

    const username = event['username'];
    //const receiveaddress = event['receiveaddress'];
    //const mobilephone = event['mobilephone'];
    const amount = event['amount'];
    const cryptotype = event['cryptotype'];
    const fiattype = event['fiattype'];
    const currency = event['currency'];
    //const cryptoamount = event['cryptoamount'];
    //const cryptoamountkraken = event['cryptoamountkraken'];
    //const cryptoprice = event['cryptoprice'];
    //const cryptosellingprice = event['cryptosellingprice'];
    //const globalfees = event['globalfees'];
    //const ejarafees = event['ejarafees'];
    //const krakenfees = event['krakenfees'];
    //const blockchainfees = event['blockchainfees'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;


    //Check params
    if ((username == "" || username == null) || (amount == "" || amount == null)
        || (cryptotype == "" || cryptotype == null) || (fiattype == "" || fiattype == null)
        || (currency == "" || currency == null)) {
        callback(null, { headercode: 400, message: 'Missing arguments', value: '', error: true });
    }

    pool.getConnection(function (err, connection) {
        // Use the connection
        connection.query('SELECT `wallettype_id` FROM `wallets_type` WHERE `Code`=\'' + cryptotype + '\' OR `Code`=\'' + fiattype + '\';', function (error, results, fields) {
            // And done with the connection.
            // Handle error after the release.
            if (error) {
                //callback(error);
                callback(null, { headercode: 400, message: error.message, value: '', error: true });
            }
            else {
                if (results.length < 2) {
                    callback(null, { headercode: 400, message: "Incorrect Crypto or Fiat Type", value: "", error: true });
                } else {
                    let wallettype_id = results[0].wallettype_id;
                    let fiatmoney_id = results[1].wallettype_id;
                    connection.query('SELECT `customers_id`, `balance_cfa` FROM `customers` WHERE `login`=\'' + username + '\';', function (error, results, fields) {
                        // And done with the connection.
                        // Handle error after the release.
                        if (error) {
                            //callback(error);
                            callback(null, { headercode: 400, message: error.message, value: '', error: true });
                        }
                        else {
                            if (results.length == 0) {
                                callback(null, { headercode: 400, message: "Incorrect username", value: "", error: true });
                            }
                            else if (amount > results[0].balance_cfa) {
                                callback(null, { headercode: 400, message: "Insufficient Balance", value: "", error: true });
                            } else {
                                let customers_id = results[0].customers_id;
                                connection.query('SELECT currency_code, currency_label, current_exchange_rate FROM currency WHERE currency_code=\'' + currency + '\'', function (error, results, fields) {
                                    // And done with the connection.
                                    //connection.release();
                                    // Handle error after the release.
                                    if (error) {
                                        //callback(error);
                                        callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                    }
                                    else {
                                        if (results.length == 0) {
                                            callback(null, { headercode: 400, message: 'Incorrect Currency Code', value: '', error: true });
                                        } else {
                                            //Calcul de fees
                                            //console.log('req fees : ' + 'SELECT appservices.service_code, wallets_type.Code, ejarafees, networkfees, otherfees FROM appfees INNER JOIN appservices ON appfees.appservices_id = appservices.appservices_id INNER JOIN wallets_type ON appfees.wallettype_id = wallets_type.wallettype_id WHERE `wallets_type`.`Code` = \'' + wallettype + '\' AND appservices.service_code = \'BUY\'')
                                            connection.query('SELECT appservices.service_code, wallets_type.Code, ejarafees, networkfees, otherfees FROM appfees INNER JOIN appservices ON appfees.appservices_id = appservices.appservices_id INNER JOIN wallets_type ON appfees.wallettype_id = wallets_type.wallettype_id WHERE `wallets_type`.`Code` = \'' + cryptotype + '\' AND appservices.service_code = \'BUY\'', function (error, resultsfees, fields) {
                                                if (error) {
                                                    //callback(error);
                                                    callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                                }
                                                else {
                                                    req = 'SELECT usdprice, cfaprice, eurprice, usdcfasellprice FROM crypto_pricing WHERE cryptocode = \'' + cryptotype + '\'';
                                                    //console.log("req crypto price : " + req);
                                                    connection.query(req, function (error, resultscryptoprice, fields) {
                                                        // And done with the connection.
                                                        // Handle error after the release.
                                                        if (error) {
                                                            //callback(error);
                                                            callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                                        }
                                                        else {
                                                            //console.log("result fees : " + JSON.stringify(resultsfees));
                                                            //console.log("result crypto price : " + JSON.stringify(resultscryptoprice))
                                                            var CryptoPriceKraken;
                                                            var tmpcurrency = currency.toLowerCase();
                                                            if (currency == "XAF") {
                                                                tmpcurrency = "cfa" + "price"
                                                                CryptoPriceKraken = parseFloat(resultscryptoprice[0][tmpcurrency])
                                                            } else {
                                                                tmpcurrency = tmpcurrency + "price"
                                                                CryptoPriceKraken = parseFloat(resultscryptoprice[0][tmpcurrency])
                                                            }

                                                            //Cryptopriceejara : valeur a laquelle ejara vend un unite de crypto
                                                            //Otherfees = Krakenfees
                                                            var CryptoSellingPriceEjara = parseFloat(CryptoPriceKraken) * (1 + parseFloat(resultsfees[0].otherfees));

                                                            //prix auquel ejara vend un dollar de crypto (en fcfa)
                                                            var CryptoSellingPrice = parseFloat(resultscryptoprice[0].usdcfasellprice)

                                                            //Fees de ejara en pourcentage
                                                            var EjaraFees = parseFloat(resultsfees[0].ejarafees);


                                                            //Quantité total de crypto a correspondant au montant entrée par l'utilisateur
                                                            var CryptoAmount = parseFloat(amount) / parseFloat(CryptoSellingPriceEjara);

                                                            //Quantité total de crypto que le client va recevoir (moins les frais d'acheminement)
                                                            var TransactiontotalCrypto = parseFloat(CryptoAmount) - parseFloat(resultsfees[0].networkfees)

                                                            //Quantité total de fiat que le client doit depenser
                                                            var TransactionTotalFiat = parseFloat(amount) * (1 + parseFloat(resultsfees[0].ejarafees))

                                                            callback(null,
                                                                {
                                                                    headercode: 200,
                                                                    message: "Previews Buy Transaction success",
                                                                    value: {
                                                                        ejarafees: EjaraFees,
                                                                        networkfees: resultsfees[0].networkfees,
                                                                        cryptoamount: CryptoAmount,
                                                                        cryptosellingpriceejara: CryptoSellingPriceEjara,
                                                                        transactiontotalcrypto: TransactiontotalCrypto,
                                                                        transactiontotalfiat: TransactionTotalFiat
                                                                    },
                                                                    error: false
                                                                }
                                                            );
                                                        }
                                                    });
                                                }
                                            });
                                        }
                                    }
                                });
                            }
                        }
                    });
                }
            }
        });
    });
};