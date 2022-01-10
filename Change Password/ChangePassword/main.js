var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    const password = event['password'];
    const email = event['email'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);
    
    
    //Check params
	if((email == "" || email == null) || (password == "" || password== null)){
        callback(null, {headercode : 400, message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT `login` FROM `customers` WHERE `email`=\'' + email + '\';', function (error, results, fields) {
            // And done with the connection.
            connection.release();
            // Handle error after the release.
            if (error){
                //callback(error);
                callback(null, {headercode : 400, message: error.message, value : '', error :true});
            }
            else{
                if (results.length == 0){
                    callback(null, {headercode : 400, message: 'Incorrect Email', value : '', error :true});
                }else{
					let req = 'UPDATE customers SET password=\'' + password + '\' WHERE email=\''+ email +'\'';
					//console.log('SQL Login 1 : ' + req);

					
                    pool.query(req, (error,row/*,fields*/) => {
                        if(error){
                            callback(null, {headercode : 400, message: error.message, value : '', error :true});
                            return ;
                        }
                        else{
                            callback(null, {headercode : 200, message: 'Change Password Success', value : '', error :false});
                        } 
                    });
                }
            }
        });
    });
};