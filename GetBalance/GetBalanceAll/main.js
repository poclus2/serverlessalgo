var http = require('http'); var mysql = require('mysql');
var config = require('./config.json');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

exports.handler = (event, context, callback) => {
    const username = event['username'];
    const publickeyhash = event['publickeyhash'];
    const currency = event['currency'];

    var btcbalance = 0;
    var xtzbalance = 0;

    var btcfiatbalance = 0;
    var xtzfiatbalance = 0;

    var cfabalance = 0;
    var cfaconvertbalance = 0;

    //Fiat : cfa
    var convertionBTCtoFiat = 1;
    var convertionXTZtoFiat = 1;

    //Convert cfa to fiat value
    var convertionToFiat = 1;




    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //Check params
    if ((username == "" || username == null) || (publickeyhash == "" || publickeyhash == null)
        || (currency == "" || currency == null)) {
        callback(null, { headercode: 400, message: 'Missing arguments', value: '', error: true });
    }

    pool.getConnection(function (err, connection) {
        // Use the connection
        connection.query('SELECT `balance_cfa` FROM `customers` WHERE `login`=\'' + username + '\'', function (error, results, fields) {
            // And done with the connection.
            //connection.release();
            // Handle error after the release.
            if (error) {
                //callback(error);
                callback(null, { headercode: 400, message: error.message, value: '', error: true });
            }
            else {
                if (results.length == 0) {
                    callback(null, { headercode: 400, message: 'Incorrect username', value: '', error: true });
                } else {
                    cfabalance = results[0].balance_cfa;
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
                                        //console.log("result : " + result);

                                        var tmpcurrency = currency.toLowerCase();

                                        //Selection du referenciel de prix en fonction de la currency en parametres
                                        if (currency == "XAF") {
                                            tmpcurrency = "cfa" + "price"
                                            console.log("tmp price : " + tmpcurrency)
                                        } else {
                                            tmpcurrency = tmpcurrency + "price"
                                            console.log("tmp price : " + tmpcurrency)
                                        }

                                        convertionToFiat = parseFloat(result[0].cfaprice) / parseFloat(result[0][tmpcurrency]);
                                        console.log("convertionToFiat : " + convertionToFiat);

                                        cfaconvertbalance = cfabalance / convertionToFiat;
                                        console.log("cfa balance final: " + cfaconvertbalance);

                                        
                                        for (var i in result) {
                                            //console.log("result : " + result[i]);

                                            //Recuperation du prix en fonction de la currency en parametres
                                            if (result[i].cryptocode == "BTC") {
                                                convertionBTCtoFiat = result[i][tmpcurrency];
                                            } else if (result[i].cryptocode == "XTZ") {
                                                convertionXTZtoFiat = result[i][tmpcurrency];
                                            }

                                            //Recuperation de la valeur de conversion pour les wallets fiat (cfa pour l'instant)
                                            
                                        }
                                        GetBalanceBTC();
                                    }
                                });
                            }
                        }
                    })
                }
            }
        });
    });

    function GetBalanceBTC() {
        const data = JSON.stringify({
            id: username
        });

        const options = {
            hostname: 'api.ejara.io',
            method: 'GET',
            port: 4000,
            path: '/btcGetBalance',
            headers: {
                'Content-Type': 'application/json',
                'Content-Length': data.length
            }
        }

        const httpreq = http.request(options, (res) => {
            //console.log(`statusCode: ${res.statusCode}`)
            res.on('data', (d) => {
                //process.stdout.write(d);
                let tmp = '';
                tmp += d;

                //console.log("tmp value : " + JSON.stringify(tmp))
                //console.log("options : " + JSON.stringify(options))


                tmp = JSON.parse(tmp);
                btcbalance = tmp.confirmed;

                //convert satoshi to btc
                btcbalance = btcbalance / 100000000;

                //fiat value of crypto balance
                btcfiatbalance = btcbalance * convertionBTCtoFiat;

                GetBalanceXTZ();
                //callback(null,{headercode:200, message:"Get BTC Balance success", value:{BTC : tmp.confirmed }, error:false});
            })
        })

        httpreq.on('error', (error) => {
            //connection.release();
            callback(null, { headercode: 400, message: error.message, value: '', error: true });
        })

        httpreq.write(data);
        httpreq.end();
    }

    function GetBalanceXTZ() {
        const data = JSON.stringify({
            publickeyhash: publickeyhash
        });

        const options = {
            hostname: 'api.ejara.io',
            method: 'GET',
            port: 4000,
            path: '/XTZGetBalance',
            headers: {
                'Content-Type': 'application/json',
                'Content-Length': data.length
            }
        }

        const httpreq = http.request(options, (res) => {
            //console.log(`statusCode: ${res.statusCode}`)
            res.on('data', (d) => {
                //process.stdout.write(d);
                let tmp = '';
                tmp += d;

                //console.log('data : ' + data);
                //console.log('options : ' + JSON.stringify(options));
                //console.log('tmp : ' + tmp);

                tmp = JSON.parse(tmp);
                //console.log('tmp 2: ' + tmp[0]);


                if (tmp == '') {
                    callback(null,
                        {
                            headercode: 200,
                            message: "Get All Balance success",
                            value: {
                                convertionvalue : {
                                    XAFtocurrency : convertionToFiat
                                },
                                wallets : {
                                    XAF: {
                                        basevalue : cfabalance,
                                        convertion : cfaconvertbalance
                                    },
                                    BTC: {
                                        crypto: btcbalance,
                                        fiat: btcfiatbalance
                                    },
                                    XTZ: {
                                        crypto: 0,
                                        fiat: 0
                                    }
                                }
                            },
                            error: false
                        }
                    );
                }
                else {
                    //convert mXTZ to XTZ
                    xtzbalance = tmp[0].balance / 1000000;

                    //fiat value of crypto balance
                    xtzfiatbalance = xtzbalance * convertionXTZtoFiat;

                    callback(null,
                        {
                            headercode: 200,
                            message: "Get All Balance success",
                            value: {
                                convertionvalue : {
                                    XAFtocurrency : convertionToFiat
                                },
                                wallets : {
                                    XAF: {
                                        basevalue : cfabalance,
                                        convertion : cfaconvertbalance
                                    },
                                    BTC: {
                                        crypto: btcbalance,
                                        fiat: btcfiatbalance
                                    },
                                    XTZ: {
                                        crypto: xtzbalance,
                                        fiat: xtzfiatbalance
                                    }
                                }
                            },
                            error: false
                        }
                    );
                }
            })
        })

        httpreq.on('error', (error) => {
            //connection.release();
            callback(null, { headercode: 400, message: error.message, value: '', error: true });
        })

        httpreq.write(data)
        httpreq.end()
    }
};



