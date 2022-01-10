var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    var username = event['username'];
    
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;
    
    //callback(null, username);
    //Check params
    if(username == "" || username == null){
        callback(null, {headercode : 'error', message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT login from customers where login=\''+ username +'\'', function (error, results, fields) {
            // And done with the connection.
            connection.release();
            // Handle error after the release.
            if (error){
                //callback(error);
                callback(null, {headercode : 'error', message: error.message, value : '', error :true});
            }
            else{
                if (results.length > 0){
                    callback(null, {headercode : 'good', message: 'Username already exist', value : '', error :false});
                }else{
                    callback(null, {headercode : 'good', message: 'Username doesn\'t exist', value : '', error :false});
                }
            }
        });
    });
};