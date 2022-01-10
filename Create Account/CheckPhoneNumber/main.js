var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    var phone = event['phone'];
    
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;
    
    
    //Check params
    if(phone == "" || phone == null){
        callback(null, {headercode : 'error', message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT `mobilephone` FROM `customers` WHERE `mobilephone`=\''+ phone +'\'', function (error, results, fields) {
            // And done with the connection.
            connection.release();
            // Handle error after the release.
            if (error){
                //callback(error);
                callback(null, {headercode : 'error', message: error.message, value : '', error :true});
            }
            else{
                if (results.length > 0){
                    callback(null, {headercode : 'good', message: 'Mobilephone already exist', value : '', error :false});
                }else{
                    callback(null, {headercode : 'good', message: 'Mobilephone doesn\'t exist', value : '', error :false});
                }
            }
        });
    });
};