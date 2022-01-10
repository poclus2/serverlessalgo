var mysql = require('mysql');
var http = require('http');
var config = require('./config.json');
var getDateTime = require('./date');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

var customers_id = 0;


exports.handler =  (event, context, callback) => {
    const username = event['username'];
    const amount = event['amount'];
    const password = event['password'];
    const receiveraddress = event['receiveraddress'];
    const transactionnote = event['transactionnote'];

    
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);
    
    
    //Check params
    if((username == "" || username == null) || (amount == "" || amount == null) 
    || (receiveraddress == "" || receiveraddress == null) || (password == "" || password == null)
        || (transactionnote == "" || transactionnote == null)){
        callback(null, {headercode : 400, message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        if (err){
            //callback(error);
             callback(null, {headercode : 400, message: err.message, value : '', error :true});
        }
        connection.query('SELECT `login`, `customers_id` FROM `customers` WHERE `login`=\'' + username + '\';', function (error, results, fields) {
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
                    customers_id = results[0].customers_id;
					SendBTC();
                }
            }
        });
    });

    function SendBTC(){
        const data = JSON.stringify({
            id : username,
            passphrase : password,
            value : amount,
            address : receiveraddress,
        });
    
        const options = {
            hostname: 'api.ejara.io',
            method: 'POST',
            port: 4000,
            path: '/SendBtc',
            headers: {
              'Content-Type': 'application/json',
              'Content-Length': data.length
            }
        }
        
        const httpreq = http.request(options, (res) => {
            //console.log(`statusCode: ${res.statusCode}`)
            res.on('data', (d) => {
                //process.stdout.write(d);
                let tmp ='';
                tmp += d;
                
                //console.log("tmp value : " + tmp)
                //console.log("options : " + JSON.stringify(options))
    
                tmp = JSON.parse(tmp);
                if(tmp.message == 'The amount is insufficient to make transaction'){
                    callback(null,{headercode:400, message:"The amount is insufficient to make transaction", value: '', error:true});
                }else if(tmp.message == 'Insufficient balance'){
                    callback(null,{headercode:400, message:"Insufficient balance", value: '', error:true});
                }else if(tmp.message == 'Incorrect receiver address'){
                    callback(null,{headercode:400, message:"Incorrect receiver address", value: '', error:true});
                }else if(tmp.message == 'Send BTC success'){
                    let req = 'SELECT `wallettype_id` FROM `wallets_type` WHERE `Code`=\'XTZ\'';
                    //console.log('request wallet-id :' + req);
                    pool.query(req, (err, rows/*,fields*/) => {
                        if (err) {
                            console.log(err.message);
                            callback(null, { headercode: 400, message: err.message, value: '', error: true });
                            return;
                        }
                        let wallettype_id = rows[0].wallettype_id;
                        req = 'SELECT `wallet_id` FROM `wallet` WHERE `customer_id`=' + customers_id + ' AND `wallettype_id` = ' + 1 + ';';
                        console.log('request wallet-id :' + req);
                        pool.query(req, (err, rows/*,fields*/) => {
                            if (err) {
                                console.log(err.message);
                                callback(null, { headercode: 400, message: err.message, value: '', error: true });
                                return;
                            }
                            let idwalletsender = rows[0].wallet_id;
                            req = 'SELECT service_code, networkfees FROM `ejara-db`.appfees INNER JOIN appservices ON appfees.appservices_id = appservices.appservices_id WHERE service_code = \'SND\' AND wallettype_id = ' + 1 ;
                            pool.query(req, (err, results/*,fields*/) => {
                                if (err) {
                                    console.log('error: ' + err.message);
                                    callback(null, { headercode: 400, message: err.message, value: '', error: true });
                                    return;
                                }
                                
                                let fees = parseFloat(results[0].networkfees) * 100000000;
                                let createtime = getDateTime();
                                req = `INSERT INTO transactions (wallettype_id, A_orderid, A_amount, A_commission, transaction_date, B_amount, B_commission, A_walletid, namereceiver, phonenumber, receiveaddress, transaction_note, fees) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)`;
                                todo = [wallettype_id, customers_id, amount, 0, createtime, 0, 0, idwalletsender, 'External', null, receiveraddress, transactionnote, fees];
                                pool.query(req, todo, (err, results/*,fields*/) => {
                                    if (err) {
                                        console.log('error: ' + err.message);
                                        callback(null, { headercode: 400, message: err.message, value: '', error: true });
                                        return;
                                    }
                                    callback(null, { headercode: 200, message: 'Send BTC success', value: tmp.value, error: true });
                                });
                            });
                        });
                    });
                }else{
                    callback(null,{headercode:400, message: 'Send BTC error', value: '', error:true});
                }
            })
        })
        
        httpreq.on('error', (error) => {
            //connection.release();
            callback(null,{headercode:400, message: error.message, value: '', error:true});
        })
        
        httpreq.write(data);
        httpreq.end();
    }
    
};