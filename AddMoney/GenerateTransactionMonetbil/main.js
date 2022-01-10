var mysql = require('mysql');
var config = require('./config.json');
var getDateTime = require('./date');
var https = require('https');
var querystring = require('querystring')

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

    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;


    //Check params
    if ((username == "" || username == null) || (identification == "" || identification == null) || (amount == "" || amount == null)) {
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

                            //console.log("Requete check existing transaction : " + 'SELECT `customers_id`, `amount`, `transaction_date`, `statut` FROM addmoney WHERE customers_id=\'' + customers_id + '\'  AND identification =\'' + identification + '\'  AND amount= \'' + globalamount + '\' AND (transaction_date between \'' + createtimeEarly + '\' AND \'' + createtimeLate + '\')');

                            var createtime = getDateTime.getDateTime();
                            req = 'INSERT INTO addmoney (customers_id, identification, amount, transaction_date, statut, add_source_type_id, fees, operator_fees) VALUES(' + customers_id + ',\'' + identification + '\',' + amount + ',\'' + createtime + '\',0, \'' + '1' + '\',' + apifees + ',\'' + operatorfees + '\')';
                            connection.query(req, function (error, results, fields) {
                                // And done with the connection.
                                // Handle error after the release.
                                if (error) {
                                    //callback(error);
                                    callback(null, { headercode: 400, message: error.message, value: '', error: true });
                                }
                                else {
                                    //console.log("results save transact : " + JSON.stringify(results))
                                    //var return_url = "https://9airddfpjc.execute-api.us-east-1.amazonaws.com/EjaraProd/addmoney/updatemonetbiltransaction" //+"?transactionid=" + results.insertId + "&identification=" + identification + "&amount=" + amount
                                    var return_url = "https://ejara.ejara"
                                    const data = querystring.stringify({
                                        amount: amount,
                                        phone: identification,
                                        user: username,
                                        locale: 'en',
                                        payment_ref: results.insertId,
                                        return_url: return_url
                                    })
                
                                    const options = {
                                        hostname: 'api.monetbil.com',
                                        port: 443,
                                        path: '/widget/v2.1/bFhwL6Hfv48gyi9ZdxlcrtJ177vgXQFw',
                                        method: 'POST',
                                        headers: {
                                            'Content-Type': 'application/x-www-form-urlencoded',
                                            'Content-Length': data.length
                                        }
                                    }
                                    console.log(data);
                                    //envoi de la requete vers monetbil
                                    const req = https.request(options, res => {
                                        console.log(`statusCode: ${res.statusCode}`)
                
                                        res.on('data', d => {
                                            process.stdout.write(d)
                                            console.log(JSON.parse(d).payment_url);
                                            // debut de sauvegarde de la requete de monetbil
                                            callback(null, { headercode: 200, message: "Payment Generation Success", value: {payment_url : JSON.parse(d).payment_url}, error: false });
                                            
                                        });
                                    });
                
                                    req.on('error', error => {
                                        console.error(error)
                                        callback(null, { headercode: 400, message: error, value: '', error: false });
                                    })
                
                                    req.write(data);
                                    req.end();
                                }
                            });
                        }
                    });
                }
            }
        });
    });
};