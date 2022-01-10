var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    const username = event['username'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;
    
    //Check params
	if((username == "" || username == null)){
        callback(null, {headercode : 400, message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT mnemonic_statut FROM customers WHERE login = \'' + username +'\'', function (error, results, fields) {
            // And done with the connection.
            //connection.release();
            // Handle error after the release.
            if (error){
                //callback(error);
                callback(null, {headercode : 400, message: error.message, value : '', error :true});
            }
            else{
                if (results.length == 0){
                    callback(null, {headercode : 400, message: 'Incorrect username', value : '', error :true});
                }else{
                    req = `UPDATE customers SET mnemonic_statut = ? WHERE login = ?`;
                    todo = [1, username];
                    connection.query(req, todo, function (error, results, fields) {
                        // And done with the connection.
                        // Handle error after the release.
                        if (error) {
                            //callback(error);
                            callback(null, { headercode: 400, message: error.message, value: '', error: true });
                        }
                        else {
                            callback(null,{headercode: 200, message:"Set Backup Mnemonic Statut success", value: '', error:false});
                        }
                    });
                }
            }
        });
    });
};