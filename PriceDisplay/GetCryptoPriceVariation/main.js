var mysql = require('mysql');
var config = require('./config.json');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

exports.handler = (event, context, callback) => {
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);
    pool.getConnection(function (err, connection) {
        // Use the connection
        connection.query("SELECT `cryptocode`,`Var24h`, `Var7d`, `Var30d`, `Var1y` FROM `crypto_pricing`", function (error, result, fields) {
            // And done with the connection.
            connection.release();
            // Handle error after the release.
            if (error) {
                //callback(error);
                callback(null, { headercode: 400, message: error.message, value: '', error: true });
            }
            else {
                if (result.length == 0) {
                    callback(null, { headercode: 400, message: 'Invalid data', value: '', error: false });
                } else {
                    let resultBTC;
                    let resultXTZ;
                    let resultXLM;

                    for (var i in result) {
                        if (result[i].cryptocode == "BTC") {
                            resultBTC = {
                                var24h: result[i].Var24h,
                                var7d: result[i].Var7d,
                                var30d: result[i].Var30d,
                                var1y: result[i].Var1y,
                            }
                        } else if (result[i].cryptocode == "XTZ") {
                            resultXTZ = {
                                var24h: result[i].Var24h,
                                var7d: result[i].Var7d,
                                var30d: result[i].Var30d,
                                var1y: result[i].Var1y,
                            }
                        } else if (result[i].cryptocode == "XLM") {
                            resultXLM = {
                                var24h: result[i].Var24h,
                                var7d: result[i].Var7d,
                                var30d: result[i].Var30d,
                                var1y: result[i].Var1y,
                            }
                        }
                        //console.log('Customers_id: ', rows[i].customers_id);
                    }
                    callback(null, { headercode: 200, message: 'Get crypto price variations success', value: { BTC : resultBTC, XTZ : resultXTZ, XLM : resultXLM}, error: false });
                }
            }
        });
    });
};