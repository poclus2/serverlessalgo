var mysql = require('mysql');
var config = require('./config.json');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

exports.handler = (event, context, callback) => {
    const id = event['id'];
    
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;


    //Check params
    if ((id == "" || id == null)) {
        callback(null, { headercode: 400, message: 'Missing arguments', value: '', error: true });
    }

    pool.getConnection(function (err, connection) {
        // Use the connection
        connection.query('SELECT transaction_date, transaction_id, statut FROM addmoney WHERE transaction_id=' + id + ';', function (error, results, fields) {
            // And done with the connection.
            // Handle error after the release.
            if (error) {
                //callback(error);
                callback(null, { headercode: 400, message: error.message, value: '', error: true });
            }
            else {
                if (results.length == 0) {
                    callback(null, { headercode: 400, message: "Incorrect Transaction Id", value: "[]", error: true });
                } 
                else if(results[0].statut != 0){
                    callback(null, { headercode: 400, message: "Transaction Cannot Be Cancelled", value: "", error: true });
                }
                else {
                    req = `UPDATE addmoney SET statut = ? WHERE transaction_id = ?`;
                    todo = [2, id];
                    connection.query(req, todo, function (error, results, fields) {
                        // And done with the connection.
                        // Handle error after the release.
                        if (error) {
                            //callback(error);
                            callback(null, { headercode: 400, message: error.message, value: '', error: true });
                        }
                        else {
                            callback(null, { headercode: 200, message: "Cancellation Add Transaction success", value:'', error: false });
                        }
                    });
                }
            }
        });
    });
};