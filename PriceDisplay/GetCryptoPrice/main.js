var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    var cryptocode = event['cryptocode'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);
    
    
    //Check params
    if(cryptocode == "" || cryptocode == null){
        callback(null, {headercode : 400, message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT usdprice, cfaprice, eurprice, usdcfasellprice, usdcfasellpricepromo FROM crypto_pricing WHERE cryptocode = \'' + cryptocode + '\';', function (error, results, fields) {
            // And done with the connection.
            connection.release();
            // Handle error after the release.
            if (error){
                //callback(error);
                callback(null, {headercode : 400, message: error.message, value : '', error :true});
            }
            else{
                if (results.length == 0){
                    callback(null, {headercode : 400, message: 'Invalid cryptocode', value : '', error :false});
                }else{
                    var tmp= {
                        usdprice : results[0].usdprice,
                        cfaprice : results[0].cfaprice,
                        eurprice : results[0].eurprice,
                        usdcfasellprice : results[0].usdcfasellprice,
                        usdcfasellprice : results[0].usdcfasellpricepromo
                    }
                    callback(null, {headercode : 200, message: 'Get crypto price success', value : results, error :false});
                }
            }
        });
    });
};