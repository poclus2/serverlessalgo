var mysql = require('mysql');
var config = require('./config.json');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

exports.handler = (event, context, callback) => {
    var login = event['login'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);


    //Check params
    if (login == "" || login == null) {
        callback(null, { headercode: 'error', message: 'Missing arguments', value: '', error: true });
    }

    pool.getConnection(function (err, connection) {
        // Use the connection
        connection.query('SELECT `service_port`,`service_name`,`service_code`,`service_url`,`service_active` FROM `appservices`', function (error, rows, fields) {
            // And done with the connection.
            // Handle error after the release.
            if (error) {
                //callback(error);
                callback(null, { headercode: 400, message: error.message, value: '', error: true });
            }
            else {
                if (rows.length == 0) {
                    callback(null, { headercode: 400, message: 'Invalid data', value: '', error: false });
                } else {
                    connection.query('SELECT `login`, `status_id` FROM `customers` WHERE login = \'' + login + '\'', function (error, rows1, fields) {
                        if (error) {
                            //callback(error);
                            callback(null, { headercode: 400, message: error.message, value: '', error: true });
                        }
                        else {
                            if (rows1.length == 0) {
                                callback(null, { headercode: 400, message: 'Incorrect username', value: '', error: false });
                            } else {
                                var reti = new Array;

                                var accountLock = rows1[0].status_id;
                                var ret = {
                                    account: login,
                                    statut: accountLock,
                                };
                                reti.push(ret);
                                if (rows1[0].status_id == 0) {
                                    //Account bloqué
                                    callback(null, { headercode: 200, message: 'Get services availability success', value: reti, error: false });
                                } else if (rows1[0].status_id == 1) {
                                    connection.query('SELECT `customers`.`login`, `appservices`.`service_code`, `statut` FROM `blockeduser` INNER JOIN `appservices` ON `blockeduser`.`appservices_id` = `appservices`.`appservices_id` INNER JOIN `customers` ON `blockeduser`.`customers_id` = `customers`.`customers_id` WHERE `blockeduser`.`statut` = 1 AND `customers`.`login` = \'' + login + '\'', [true], (err2, rows2/*,fields*/) => {
                                        if (err2) {
                                            console.log('Error 3 : ' + err2.message);
                                            callback(null, { headercode: 400, message: err2.message, value: '', error: true });
                                            return;
                                        }
                                        for (var i in rows) {

                                            var servicePort = rows[i].service_port;
                                            var serviceName = rows[i].service_name;
                                            var serviceCode = rows[i].service_code;
                                            var serviceUrl = rows[i].service_url;
                                            var serviceActive = rows[i].service_active;
                                            var serviceCodeUser;
                                            //1 pour service debloqué
                                            var serviceStatutuser = 1;
                                            for (var i in rows2) {
                                                var serviceCodeUser = rows2[i].service_code;
                                                //var serviceStatutuser = rows2[i].statut;
                                                if (serviceCode == serviceCodeUser) {
                                                    serviceStatutuser = rows2[i].statut;
                                                    //Ici on inverse la logique renvoyé par la table blockeduser: 1: Bloqué, 0: debloqué
                                                    //Pour la rendre conforme a celle des autres données 0: inatif, 1: actif
                                                    if (serviceStatutuser == 1) {
                                                        serviceStatutuser = 0;
                                                    }
                                                    else if (serviceStatutuser == 0) {
                                                        serviceStatutuser = 1;
                                                    }
                                                    //console.log('Servicestatutuser : ' + serviceStatutuser + ", base statut : " + rows2[i].statut);
                                                }
                                            }
                                            var ret =
                                                count =
                                                {
                                                    service_port: servicePort,
                                                    service_name: serviceName,
                                                    service_code: serviceCode,
                                                    service_url: serviceUrl,
                                                    service_active: serviceActive,
                                                    service_active_for_user: serviceStatutuser,
                                                };
                                            reti.push(ret);
                                        }

                                        var jsonret = JSON.stringify(reti);
                                        callback(null, { headercode: 200, message: 'Get services availability success', value: reti, error: false });

                                    });
                                }
                                else {
                                    callback(null, { headercode: 400, message: 'Invalid statut', value: reti, error: true });
                                }

                            }
                        }
                    });
                }
            }
        });
    });
};