var mysql = require('mysql');
var config = require('./config.json');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

var convertionToFiat = 1;

exports.handler = (event, context, callback) => {
    const username = event['username'];
    const currency = event['currency'];

    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //Check params
    if ((username == "" || username == null) || (currency == "" || currency == null)) {
        callback(null, { headercode: 400, message: 'Missing arguments', value: '', error: true });
    }

    pool.getConnection(function (err, connection) {
        // Use the connection
        connection.query('SELECT `balance_cfa` FROM `customers` WHERE `login`=\'' + username + '\'', function (error, results, fields) {
            // And done with the connection.
            connection.release();
            // Handle error after the release.
            if (error) {
                //callback(error);
                callback(null, { headercode: 400, message: error.message, value: '', error: true });
            }
            else {
                if (results.length == 0) {
                    callback(null, { headercode: 400, message: 'Incorrect username', value: '', error: true });
                } else {
                    var balance = results[0].balance_cfa;

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
                                pool.query("SELECT cryptocode, usdprice, cfaprice, eurprice, usdcfasellprice FROM crypto_pricing", function (err, result, fields) {
                                    if (error) {
                                        //callback(error);
                                        callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                    }
                                    else {
                                        var tmpcurrency = currency.toLowerCase();

                                        //Selection du referenciel de prix en fonction de la currency en parametres
                                        if (currency == "XAF") {
                                            tmpcurrency = "cfa" + "price"
                                            console.log("tmp price : " + tmpcurrency)
                                        } else {
                                            tmpcurrency = tmpcurrency + "price"
                                            console.log("tmp price : " + tmpcurrency)
                                        }

                                        var convertionToFiat = parseFloat(result[0].cfaprice) / parseFloat(result[0][tmpcurrency]);
                                        console.log("convertionToFiat : " + convertionToFiat);

                                        var convertbalance = balance / convertionToFiat;
                                        console.log("cfa balance final: " + convertbalance);


                                        callback(null, {
                                            headercode: 200,
                                            message: 'Get Balance CFA success',
                                            value: {
                                                convertionvalue: {
                                                    XAFtocurrency: convertionToFiat
                                                }, wallet: {
                                                    XAF: {
                                                        basevalue: balance,
                                                        convertion: convertbalance
                                                    }
                                                }
                                            },
                                            error: false
                                        }
                                        );
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