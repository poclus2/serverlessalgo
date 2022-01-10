var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    var email = event['email'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);
    
    
    //Check params
    if(email == "" || email == null){
        callback(null, {headercode : 'error', message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT email from customers where email=\''+ email +'\'', function (error, results, fields) {
            // And done with the connection.
            connection.release();
            // Handle error after the release.
            if (error){
                //callback(error);
                callback(null, {headercode : 'error', message: error.message, value : '', error :true});
            }
            else{
                if (results.length > 0){
                    callback(null, {headercode : 'good', message: 'Email already exist', value : '', error :false});
                }else{
                    callback(null, {headercode : 'good', message: 'Email doesn\'t exist', value : '', error :false});
                }
            }
        });
    });
};