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
    const username = event['username'];
    const identification = event['identification'];
    //const mobilephone = event['mobilephone'];
    const amount = event['amount'];
    const addsourcetype = event['addsourcetype'];

    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;


    //Check params
    if ((username == "" || username == null) || (identification == "" || identification == null) || (amount == "" || amount == null)
        || (addsourcetype == "" || addsourcetype == null)) {
        callback(null, { headercode: 400, message: 'Missing arguments', value: '', error: true });
    }

    pool.getConnection(function (err, connection) {
        // Use the connection
        connection.query('SELECT `customers_id` FROM `customers` WHERE `login`=\'' + username + '\';', function (error, results, fields) {
            // And done with the connection.
            // Handle error after the release.
            if (error) {
                //callback(error);
                callback(null, { headercode: 400, message: error.message, value: '', error: true });
            }
            else {
                if (results.length == 0) {
                    callback(null, { headercode: 400, message: 'Incorrect username', value: '', error: true });
                } else {
                    let customers_id = results[0].customers_id;
                    connection.query('SELECT appservices.service_code, wallets_type.Code, ejarafees, networkfees, otherfees FROM appfees INNER JOIN appservices ON appfees.appservices_id = appservices.appservices_id INNER JOIN wallets_type ON appfees.wallettype_id = wallets_type.wallettype_id WHERE appservices.service_code = \'ADD\'', function (error, results, fields) {
                        if (error) {
                            //callback(error);
                            callback(null, { headercode: 400, message: error.message, value: '', error: true });
                        }
                        else {
                            var apifees = amount * (results[0].ejarafees + results[0].otherfees);
                            var operatorfees = amount * results[0].networkfees;

                            var globalfees = amount * (results[0].ejarafees + results[0].otherfees + results[0].networkfees);

                            //Amount + fees total 
                            var globalamount = parseFloat(amount) + parseFloat(globalfees);

                            var createtimeEarly = getDateTime.getDateTimeEarly();
                            var createtimeLate = getDateTime.getDateTime();

                            //console.log("Requete check existing transaction : " + 'SELECT `customers_id`, `amount`, `transaction_date`, `statut` FROM addmoney WHERE customers_id=\'' + customers_id + '\'  AND identification =\'' + identification + '\'  AND amount= \'' + globalamount + '\' AND (transaction_date between \'' + createtimeEarly + '\' AND \'' + createtimeLate + '\')');

                            req = 'SELECT `customers_id`, `amount`, `transaction_date`, `statut` FROM addmoney WHERE customers_id = ? AND identification = ? AND amount=? AND (transaction_date between ? AND ?)';
                            todo = [customers_id, identification, globalamount, createtimeEarly, createtimeLate];
                            connection.query(req, todo, function (error, results, fields) {
                                // And done with the connection.
                                // Handle error after the release.
                                if (error) {
                                    //callback(error);
                                    callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                }
                                else {
                                    if (results.length > 0) {
                                        callback(null, { headercode: 400, message: "Transaction Already Set", value: '', error: true });
                                    }
                                    else{

                                        var createtime = getDateTime.getDateTime();
                                        req = 'INSERT INTO addmoney (customers_id, identification, amount, transaction_date, statut, add_source_type_id, fees, operator_fees) VALUES(' + customers_id + ',\'' + identification + '\',' + globalamount + ',\'' + createtime + '\',0, \'' + addsourcetype + '\',' + apifees + ',\'' + operatorfees + '\')';
                                        connection.query(req, todo, function (error, results, fields) {
                                            // And done with the connection.
                                            // Handle error after the release.
                                            if (error) {
                                                //callback(error);
                                                callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                            }
                                            else {
                                                const data = JSON.stringify({
                                                    amount: globalamount,
                                                    phonenumber: identification,
                                                    service: 'bFhwL6Hfv48gyi9ZdxlcrtJ177vgXQFw'
                                                })

                                                const options = {
                                                    hostname: 'api.monetbil.com',
                                                    port: 443,
                                                    path: '/payment/v1/placePayment',
                                                    method: 'POST',
                                                    headers: {
                                                        'Content-Type': 'application/json',
                                                        'Content-Length': data.length
                                                    }
                                                }
                                                //envoi de la requete vers monetbil
                                                const req = https.request(options, res => {
                                                    console.log(`statusCode: ${res.statusCode}`)

                                                    res.on('data', d => {
                                                        process.stdout.write(d)
                                                        console.log('je met en json');
                                                        console.log(JSON.parse(d).paymentId);
                                                        todo2 = [JSON.parse(d).message, JSON.parse(d).paymentId, JSON.parse(d).status, JSON.parse(d).channel];

                                                        console.log('affichage du resultat');
                                                        console.log(todo2);
                                                        // debut de sauvegarde de la requete de monetbil

                                                        console.log('suite apres status et affichage');

                                                    });

                                                    let reqlastid = 'SELECT transaction_id FROM addmoney ORDER BY transaction_id DESC LIMIT 1';
                                                    connection.query(reqlastid, (err, rows/*,fields*/) => {
                                                        if (err) {
                                                            console.log(err.message);
                                                            response.send('error');
                                                            return;
                                                        }
                                                        let transId = rows[0].transaction_id;
                                                        console.log(transId);
                                                        let insertbilr = `INSERT INTO bilresponse (message,paymentId,status,channel,transactionId) VALUES(?,?,?,?,?)`;
                                                        console.log('avant le status je verifie encore le contenue de mon tableau')
                                                        console.log(`statusCode: ${res.message}`);
                                                        console.log(todo2);
                                                        todo2.push(transId);
                                                        console.log(todo2);
                                                        console.log('structure de la req monebil ok');
                                                        connection.query(insertbilr, todo2, (err, results/*,fields*/) => {
                                                            console.log('enregitrement de la req monebil ');
                                                            if (err) {
                                                                console.log('il y a une erreur');
                                                                console.log('error:' + err.message);
                                                                response.send('error');
                                                                return;
                                                            }
                                                            console.log(results);

                                                            // derniere etape modifier en fonction du status
                                                            console.log(' debut conditition ')
                                                            if (todo2[2] === "REQUEST_ACCEPTED") {
                                                                console.log('conditition accepted')
                                                                let updatestate = 'UPDATE addmoney SET statut=\'' + 0 + '\' WHERE transaction_id=\'' + todo2[4] + '\''

                                                                connection.query(updatestate, (err, results/*,fields*/) => {
                                                                    console.log('enregitrement de la req monebil ');
                                                                    if (err) {
                                                                        console.log('il y a une erreur');
                                                                        console.log('error:' + err.message);
                                                                        response.send('error');
                                                                        return;
                                                                    }
                                                                });

                                                            } else {
                                                                console.log('condition 2 cancelled')
                                                                let updatestate = 'UPDATE addmoney SET statut=\'' + 2 + '\' WHERE transaction_id=\'' + todo2[4] + '\''

                                                                connection.query(updatestate, (err, results/*,fields*/) => {
                                                                    console.log('enregitrement de la req monebil ');
                                                                    if (err) {
                                                                        console.log('il y a une erreur');
                                                                        console.log('error:' + err.message);
                                                                        response.send('error');
                                                                        return;
                                                                    }
                                                                });

                                                            }



                                                        });

                                                    });


                                                });

                                                req.on('error', error => {
                                                    console.error(error)
                                                })

                                                req.write(data)

                                                req.end();
                                                callback(null, { headercode: 200, message: "Save Add Transaction success", value: '', error: false });
                                            }
                                        });
                                    }
                                }
                            });
                        }
                    });
                }
            }
        });
    });
};