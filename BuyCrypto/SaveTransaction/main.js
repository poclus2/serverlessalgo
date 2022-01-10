var mysql = require('mysql');
var nodemailer = require("nodemailer");
var config = require('./config.json');
var getDateTime = require('./date');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

//For mail
var transport = nodemailer.createTransport({
    host: "email-smtp.us-west-2.amazonaws.com",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
        user: "AKIA24MVVAYM2C2OJ7RS",
        pass: "BHeW3MK0JkJlhrZkHHybg9kOPbpE8wIPzYR55Si1BlxE"
    }
});

//Mail template
var mailOptions2 = {
    from: "mickael@nzinghaa.io", // sender address
    //to: "nelly@nzinghaa.io,abdel@nzinghaa.io,baptiste@nzinghaa.io,fradith@nzinghaa.io,jamal@nzinghaa.io,nchatue@gmail.com", // list of receivers
    to: "mickael@nzinghaa.io",
    subject: "Nouvelle commande à traiter ", // Subject line
    // text: "Bonjour  Nytral  "+name+ ", ", // plaintext body
    html: "<b>Hello !! </b> <br> Il y a une commande en pending  <b><br> Merci bien vouloir traiter</b>" // html body
}


exports.handler = (event, context, callback) => {

    const username = event['username'];
    const receiveaddress = event['receiveaddress'];
    //const mobilephone = event['mobilephone'];
    var amount = event['amount'];
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
    if ((username == "" || username == null) || (receiveaddress == "" || receiveaddress == null) || (amount == "" || amount == null)
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
                    callback(null, { headercode: 400, message: "Incorrect Crypto or Fiat Type", value: "", error: false });
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
                                            connection.query('SELECT appservices.service_code, wallets_type.Code, ejarafees, networkfees, otherfees FROM appfees INNER JOIN appservices ON appfees.appservices_id = appservices.appservices_id INNER JOIN wallets_type ON appfees.wallettype_id = wallets_type.wallettype_id WHERE `wallets_type`.`Code` = \'' + cryptotype + '\' AND appservices.service_code = \'BUY\'', function (error, resultsfees, fields) {
                                                if (error) {
                                                    //callback(error);
                                                    callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                                }
                                                else {
                                                    let req = 'SELECT usdprice, cfaprice, eurprice, usdcfasellprice FROM crypto_pricing WHERE cryptocode = \'' + cryptotype + '\'';
                                                    //console.log("req crypto price : " + req);
                                                    pool.query(req, function (error, resultscryptoprice, fields) {
                                                        // And done with the connection.
                                                        // Handle error after the release.
                                                    console.log("Amount 1 : " + amount);
                                                        if (error) {
                                                            //callback(error);
                                                            callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                                        }
                                                        else {
                                                            //console.log("result fees : " + JSON.stringify(resultsfees));
                                                            //console.log("result crypto price : " + JSON.stringify(resultscryptoprice))
                                                            
                                                            var tmpcurrency = currency.toLowerCase();

                                                            console.log("Amount 3 : " + amount);
                                                            //Selection du referenciel de prix en fonction de la currency en parametres
                                                            if (currency == "XAF") {
                                                                tmpcurrency = "cfa" + "price"
                                                                console.log("tmp price : " + tmpcurrency)
                                                            } else {
                                                                tmpcurrency = tmpcurrency + "price"
                                                                console.log("tmp price : " + tmpcurrency)
                                                            }
                                                            console.log("Amount 3 : " + amount);

                                                            //Convert currency to cfa for saving
                                                            var convertionToFiat = parseFloat(resultscryptoprice[0].cfaprice) / parseFloat(resultscryptoprice[0][tmpcurrency]);
                                                            console.log("convertionToFiat : " + convertionToFiat);

                                                            amount = parseFloat(amount) * parseFloat(convertionToFiat);
                                                            console.log("Amount : " + amount);




                                                            var CryptoPriceKraken = parseFloat(resultscryptoprice[0].cfaprice)
                                                            //Cryptopriceejara : valeur a laquelle ejara vend un unite de crypto
                                                            //Otherfees = Krakenfees
                                                            var CryptoSellingPriceEjara = parseFloat(CryptoPriceKraken) * (1 + parseFloat(resultsfees[0].otherfees));

                                                            //prix auquel ejara vend un dollar de crypto (en fcfa)
                                                            var CryptoSellingPrice = parseFloat(resultscryptoprice[0].usdcfasellprice)

                                                            //Fees de ejara
                                                            var BlockchainFees = parseFloat(resultsfees[0].networkfees);
                                                            //Fees de ejara
                                                            var EjaraFees = amount * parseFloat(resultsfees[0].ejarafees);
                                                            //Fees de ajouter a la valeur de Kraken
                                                            var KrakenFees = amount * parseFloat(resultsfees[0].otherfees);
                                                            //Fees total de la transaction
                                                            var GlobalFees = amount * (parseFloat(resultsfees[0].ejarafees) + parseFloat(resultsfees[0].otherfees));


                                                            //Quantité total de crypto a correspondant au montant entrée par l'utilisateur
                                                            var CryptoAmount = parseFloat(amount) / parseFloat(CryptoSellingPriceEjara);

                                                            //Quantité total de crypto que le client va recevoir (moins les frais d'acheminement)
                                                            var TransactiontotalCrypto = parseFloat(CryptoAmount) - parseFloat(resultsfees[0].networkfees)

                                                            //Quantité total de fiat que le client doit depenser
                                                            var TransactionTotalFiat = parseFloat(amount) * (1 + parseFloat(resultsfees[0].ejarafees))


                                                            var createtimeEarly = getDateTime.getDateTimeEarly();
                                                            var createtimeLate = getDateTime.getDateTime();

                                                            console.log("Requete check existing transaction : " + 'SELECT `customers_id`, `receiveaddress`, `amount`, `transaction_date`, `statut` FROM buy WHERE customers_id=\'' + customers_id + '\'  AND receiveaddress=\'' + receiveaddress + '\' AND wallettype_id=\'' + wallettype_id + '\' AND amount= \'' + amount + '\' AND (transaction_date between \'' + createtimeEarly + '\' AND \'' + createtimeLate + '\')');

                                                            req = 'SELECT `customers_id`, `receiveaddress`, `amount`, `transaction_date`, `statut` FROM buy WHERE `customers_id`=? AND receiveaddress=? AND wallettype_id=? AND amount=? AND (transaction_date between ? AND ?)';
                                                            let todo = [customers_id, receiveaddress, wallettype_id, TransactionTotalFiat, createtimeEarly, createtimeLate];
                                                            connection.query(req, todo, function (error, results, fields) {
                                                                // And done with the connection.
                                                                // Handle error after the release.
                                                                if (error) {
                                                                    //callback(error);
                                                                    callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                                                }
                                                                else {
                                                                    if (results.length > 0) {
                                                                        callback(null, { headercode: 400, message: "Transaction Already Set", value: '', error: true });
                                                                    }
                                                                    else {

                                                                        var createtime = getDateTime.getDateTime();
                                                                        req = `INSERT INTO buy (customers_id, receiveaddress, amount, transaction_date, statut, wallettype_id, wallettypefiat_id, cryptoamount, cryptoprice, cryptosellingprice, globalfees, blockchainfees, cryptoamountkraken, ejarafees, krakenfees) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`;
                                                                        todo = [customers_id, receiveaddress, TransactionTotalFiat, createtime, 0, wallettype_id, fiatmoney_id, TransactiontotalCrypto, CryptoPriceKraken, CryptoSellingPriceEjara, GlobalFees, BlockchainFees, CryptoAmount, EjaraFees, KrakenFees];
                                                                        connection.query(req, todo, function (error, results, fields) {
                                                                            // And done with the connection.
                                                                            // Handle error after the release.
                                                                            if (error) {
                                                                                //callback(error);
                                                                                callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                                                            }
                                                                            else {
                                                                                req = `UPDATE customers SET balance_cfa = balance_cfa - ? WHERE customers_id = ?`;
                                                                                todo = [amount, customers_id];
                                                                                connection.query(req, todo, function (error, results, fields) {
                                                                                    // And done with the connection.
                                                                                    // Handle error after the release.
                                                                                    if (error) {
                                                                                        //callback(error);
                                                                                        callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                                                                    }
                                                                                    else {
                                                                                        //configuration du module d'envoi des email 
                                                                                        transport.sendMail(mailOptions2, function (error, response) {
                                                                                            if (error) {
                                                                                                console.log(error);
                                                                                            } else {
                                                                                                console.log("Message sent: " + response.message);
                                                                                            }

                                                                                            // if you don't want to use this transport object anymore, uncomment following line
                                                                                            //smtpTransport.close(); // shut down the connection pool, no more messages
                                                                                        });
                                                                                        callback(null, { headercode: 200, message: "Save Buy Transaction success", value: '', error: false });
                                                                                    }
                                                                                });
                                                                            }
                                                                        });
                                                                    }
                                                                }
                                                            });
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