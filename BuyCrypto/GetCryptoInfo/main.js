var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    const cryptotype = event['cryptotype'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;
    
    //Check params
	if((cryptotype == "" || cryptotype == null)){
        callback(null, {headercode : 400, message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
		
		connection.query("SELECT usdprice, cfaprice, eurprice, usdcfasellprice, Var24h FROM crypto_pricing WHERE cryptocode = '" + cryptotype + "'", function (err, result, fields) {
            if (err){
                //callback(error);
                callback(null, {headercode : 400, message: err.message, value : '', error :true});
            }
            else{
                if (results.length == 0){
                    callback(null, {headercode : 400, message: 'Incorrect cryptotype', value : '', error :true});
                }else{
                    callback(null,{headercode:200, message:"Get crypto info success", value: result, error:false});
                }
            }
		});
    });
};