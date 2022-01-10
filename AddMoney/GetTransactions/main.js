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
        connection.query('SELECT `customers_id` FROM `customers` WHERE `login`=\'' + username + '\';', function (error, results, fields) {
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
                    let customers_id = results[0].customers_id;
                    let sql = 'SELECT amount, transaction_date, transaction_id, statut FROM addmoney WHERE customers_id=' + customers_id + ';';

                    connection.query(sql, function (error, results, fields) {
                        // And done with the connection.
                        // Handle error after the release.
                        if (error){
                            //callback(error);
                            callback(null, {headercode : 400, message: error.message, value : '', error :true});
                        }
                        else{
                            if (results.length == 0){
                                callback(null,{headercode:200, message:"Get Add Transactions success", value: "[]", error:false});
                            }else{
                                var reti = new Array;
                                for (var i in results) {
                                    var Amount = results[i].amount;
                                    var Date = results[i].transaction_date;
                                    var TransactionID = results[i].transaction_id;
                                    var Statut = results[i].statut;
                                    var ret =
                                    [
                                        count =
                                        {
                                            amount: Amount,
                                            date: Date,
                                            transactionid: TransactionID,
                                            statut: Statut,
                                        }
                                    ];
                                    reti.push(ret);
                                }

                                var jsonret = JSON.stringify(reti);
                                callback(null,{headercode:200, message:"Get Add Transactions success", value: reti, error:false});
                            }
                        }
                    });
                }
            }
        });
    });
};