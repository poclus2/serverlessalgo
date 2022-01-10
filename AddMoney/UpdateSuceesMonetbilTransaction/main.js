var mysql = require('mysql');
var config = require('./config.json');
var getDateTime = require('./date');
var https = require('https');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

exports.handler = (event, context, callback) => {

    //createtime = getDateTime();
    const transactionid = event['idtransaction'];
    const identification = event['identification'];
    //const mobilephone = event['mobilephone'];
    const amount = event['amount'];

    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;


    //Check params
    if ((transactionid == "" || transactionid == null) || (identification == "" || identification == null) || (amount == "" || amount == null)) {
        callback(null, { headercode: 400, message: 'Missing arguments', value: '', error: true });
    }

    pool.getConnection(function (err, connection) {
        // Use the connection
        var req = 'SELECT `customers_id`, `amount`, `transaction_date`, `statut` FROM addmoney WHERE transaction_id = ? AND identification = ? AND amount=? AND statut = ?';
        var todo = [transactionid, identification, amount, 0];
        connection.query(req, todo, function (error, results, fields) {
            // And done with the connection.
            // Handle error after the release.
            if (error) {
                //callback(error);
                callback(null, { headercode: 400, message: error.message, value: '', error: true });
            }
            else {
                if (results.length == 1) {
                    var customers_id = results[0].customers_id;
                    req = `UPDATE addmoney SET statut = ? WHERE transaction_id = ? AND amount = ?`;
                    todo = [1, transactionid, amount];
                    connection.query(req, todo, function (error, results, fields) {
                        // And done with the connection.
                        // Handle error after the release.
                        if (error) {
                            //callback(error);
                            callback(null, { headercode: 400, message: error.message, value: '', error: true });
                        }
                        else {
                            req = `UPDATE customers SET balance_cfa = balance_cfa - ? WHERE customers_id = ?`;
                            todo = [amount, customers_id];
                            connection.query(req, todo, function (error, results, fields) {
                                // And done with the connection.
                                // Handle error after the release.
                                if (error) {
                                    //callback(error);
                                    callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                }
                                else {
                                    callback(null, { headercode: 200, message: "Save Buy Transaction success", value: '', error: false });
                                }
                            });
                        }
                    });
                }
                else {
                    callback(null, { headercode: 400, message: "Found transaction error", value: '', error: true });
                }
            }
        });

    });
};