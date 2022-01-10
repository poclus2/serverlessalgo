var mysql = require('mysql');
var config = require('./config.json');
var getDateTime = require('./date');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

exports.handler = (event, context, callback) => {
    var username = event['username'];
    var servicecode = event['servicecode'];
    var statut = event['statut'];
    var raison = event['raison'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);


    //Check params
    if ((servicecode == "" || servicecode == null) || (username == "" || username == null) || (statut == "" || statut == null)
        || (raison == "" || raison == null)) {
        callback(null, { headercode: 'error', message: 'Missing arguments', value: '', error: true });
    }

    pool.getConnection(function (err, connection) {
        // Use the connection
        connection.query('SELECT `appservices_id`, `service_port`,`service_name`,`service_code`,`service_url`,`service_active` FROM `appservices` WHERE service_code =\'' + servicecode + '\'', function (error, rows, fields) {
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
                    let appservices_id = rows[0].appservices_id;
                    if (statut == 1) {
                        connection.query('SELECT `login`, `customers_id` FROM `customers` WHERE login = \'' + username + '\'', function (error, rows1, fields) {
                            if (error) {
                                //callback(error);
                                callback(null, { headercode: 400, message: error.message, value: '', error: true });
                            }
                            else {
                                if (rows1.length == 0) {
                                    callback(null, { headercode: 400, message: 'Incorrect username', value: '', error: false });
                                } else {
                                    let customers_id = rows1[0].customers_id;

                                    connection.query('SELECT `customers`.`login`, `appservices`.`service_code`, `statut` FROM `blockeduser` INNER JOIN `appservices` ON `blockeduser`.`appservices_id` = `appservices`.`appservices_id` INNER JOIN `customers` ON `blockeduser`.`customers_id` = `customers`.`customers_id` WHERE `blockeduser`.`statut` = 1 AND `customers`.`login` = \'' + username + '\' AND statut = 1 AND service_code = \'' + servicecode + '\'', [true], (err2, rows2/*,fields*/) => {
                                        if (err2) {
                                            console.log('Error 3 : ' + err2.message);
                                            callback(null, { headercode: 400, message: err2.message, value: '', error: true });
                                            return;
                                        } else {
                                            if (rows2.length == 0) {
                                                let createtime = getDateTime();

                                                let req = `INSERT INTO blockeduser (appservices_id, customers_id, blockeddate, raison, statut) VALUES (?,?,?,?,?)`;
                                                let todo = [appservices_id, customers_id, createtime, raison, statut];
                                                connection.query(req, todo, (err2, rows2/*,fields*/) => {
                                                    if (err2) {
                                                        console.log('Error 3 : ' + err2.message);
                                                        callback(null, { headercode: 400, message: err2.message, value: '', error: true });
                                                        return;
                                                    }
                                                    callback(null, { headercode: 200, message: "Set services availability for user success", value: '', error: false });
                                                });

                                            } else {
                                                callback(null, { headercode: 400, message: "Service already block for user", value: '', error: true });
                                            }

                                        }
                                    });
                                }
                            }
                        });
                    } else if (statut == 0) {
                        connection.query('SELECT `login`, `customers_id` FROM `customers` WHERE login = \'' + username + '\'', function (error, rows1, fields) {
                            if (error) {
                                //callback(error);
                                callback(null, { headercode: 400, message: error.message, value: '', error: true });
                            }
                            else {
                                if (rows1.length == 0) {
                                    callback(null, { headercode: 400, message: 'Incorrect username', value: '', error: false });
                                } else {
                                    let customers_id = rows1[0].customers_id;
                                    let gettime = getDateTime();

                                    let req = `UPDATE blockeduser SET statut = ?, unblockeddate = ? WHERE customers_id = ? AND appservices_id = ? AND statut = ?`;
                                    let todo = [statut, gettime, customers_id, appservices_id, 1];
                                    connection.query(req, todo, function (error, results, fields) {
                                        // And done with the connection.
                                        // Handle error after the release.
                                        if (error) {
                                            //callback(error);
                                            callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                        }
                                        else {
                                            callback(null, { headercode: 200, message: "Set services availability for user success", value: '', error: false });
                                        }
                                    });
                                }
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