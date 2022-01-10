var mysql = require('mysql');
var config = require('./config.json');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

exports.handler = (event, context, callback) => {
    var servicecode = event['servicecode'];
    var statut = event['statut'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);


    //Check params
    if ((servicecode == "" || servicecode == null) || (statut == "" || statut == null)) {
        callback(null, { headercode: 'error', message: 'Missing arguments', value: '', error: true });
    }

    pool.getConnection(function (err, connection) {
        // Use the connection
        connection.query('SELECT `service_port`,`service_name`,`service_code`,`service_url`,`service_active` FROM `appservices` WHERE service_code =\'' + servicecode + '\'', function (error, rows, fields) {
            // And done with the connection.
            // Handle error after the release.
            if (error) {
                //callback(error);
                callback(null, { headercode: 400, message: error.message, value: '', error: true });
            }
            else {
                if (rows.length == 0) {
                    callback(null, { headercode: 400, message: 'Incorrect service code', value: '', error: false });
                } else {
                    if (statut == 1 || statut == 0) {
                        let req = `UPDATE appservices SET service_active = ? WHERE service_code = ?`;
                        let todo = [statut, servicecode];
                        connection.query(req, todo, function (error, results, fields) {
                            // And done with the connection.
                            // Handle error after the release.
                            if (error) {
                                //callback(error);
                                callback(null, { headercode: 400, message: error.message, value: '', error: true });
                            }
                            else {
                                callback(null, { headercode: 200, message: "Set services availability success", value: '', error: false });
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