var mysql = require('mysql');
var config = require('./config.json');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

exports.handler = (event, context, callback) => {
    var username = event['username'];
    var statut = event['statut'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);


    //Check params
    if ((username == "" || username == null) || (statut == "" || statut == null)) {
        callback(null, { headercode: 'error', message: 'Missing arguments', value: '', error: true });
    }

    pool.getConnection(function (err, connection) {
        // Use the connection
        connection.query('SELECT `login`, `status_id` FROM `customers` WHERE login = \'' + username + '\'', function (error, rows, fields) {
            // And done with the connection.
            // Handle error after the release.
            if (error) {
                //callback(error);
                callback(null, { headercode: 400, message: error.message, value: '', error: true });
            }
            else {
                if (rows.length == 0) {
                    callback(null, { headercode: 400, message: 'Incorrect username', value: '', error: false });
                } else {
                    if (statut == 1 || statut == 0) {
                        req = `UPDATE customers SET status_id = ? WHERE login = ?`;
                        todo = [statut, username];
                        connection.query(req, todo, function (error, results, fields) {
                            // And done with the connection.
                            // Handle error after the release.
                            if (error) {
                                //callback(error);
                                callback(null, { headercode: 400, message: error.message, value: '', error: true });
                            }
                            else {
                                callback(null, { headercode: 200, message: "Set lock account success", value: '', error: false });
                            }
                        });
                    }
                    else {
                        callback(null, { headercode: 200, message: 'Invalid statut', value: '', error: false });
                    }
                }
            }
        });
    });
};