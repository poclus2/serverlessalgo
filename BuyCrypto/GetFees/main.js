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
        connection.query('SELECT appservices.service_code, wallets_type.Code, ejarafees, networkfees, otherfees FROM appfees INNER JOIN appservices ON appfees.appservices_id = appservices.appservices_id INNER JOIN wallets_type ON appfees.wallettype_id = wallets_type.wallettype_id WHERE `wallets_type`.`Code` = \'' + cryptotype + '\' AND appservices.service_code = \'BUY\';', function (error, results, fields) {
            // And done with the connection.
            //connection.release();
            // Handle error after the release.
            if (error){
                //callback(error);
                callback(null, {headercode : 400, message: error.message, value : '', error :true});
            }
            else{
                if (results.length == 0){
                    callback(null, {headercode : 400, message: 'Incorrect cryptotype', value : '', error :true});
                }else{
                    var reti ={
                        servicecode : results[0].service_code,
                        cryptocode : results[0].Code,
                        ejarafees : results[0].ejarafees,
                        networkfees : results[0].networkfees,
                        otherfees : results[0].otherfees
                    }
                    callback(null,{headercode:200, message:"Get Buy Fees success", value: reti, error:false});
                }
            }
        });
    });
};