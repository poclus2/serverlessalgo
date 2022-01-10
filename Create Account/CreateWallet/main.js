var http = require('http');
var mysql = require('mysql');
var config = require('./config');
var getDateTime = require('./date');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    let username = event.username;
    let passphrase = event.passphrase;
    let pincode = event.pincode;
    let createtime = getDateTime();
    
    //prevent timeout from waiting event loop//prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;
    
    //callback(null, username);
    //Check params
    if((username == "" || username == null) || (passphrase == "" || passphrase == null) || (pincode == "" || pincode == null)){
        callback(null, {headercode : 400, message: 'Missing arguments', error :true});
        return context.succeed();
    }
    
    //Get Result BTC
    let Mnemonic = '';
    //Get result XTZ
    let walletxtz;
        
    let customers_id = 0;
    var walletXTZexist = false;
    var walletBTCexist = false;

    pool.getConnection(function(err, connection) {

        // Use the connection
        pool.query('SELECT `customers_id`, `pincode` FROM `customers` WHERE `login`=\''+ username +'\'', function (error, results, fields) {
            // Handle error after the release.
            if (error){
                callback(null, {headercode : 400, message: error.message, error :true})
                return context.succeed();
            }
            else{
                if (results.length == 0){
                    callback(null,{headercode : 400, message: 'Bad Username', value : '', error :true});
                    return context.succeed();
                }else{
                    customers_id = results[0].customers_id;
                    
                    //Set pincode
                    if (results[0].pincode != null){
                        callback(null,{headercode : 400, message: 'Pincode Already Set', value : '', error :true});
                        return context.succeed();
                    }else{
        
                        let sql = `UPDATE customers
                        SET pincode = ?
                        WHERE customers_id = ?`;
                        let data = [pincode, customers_id];
        
                        pool.query(sql, data, (err,rows/*,fields*/) => {
                            if(err){
                                callback(null, {headercode : 400, message: err.message, error :true});
                                return context.succeed();
                            }
                            pool.query('SELECT `customer_id`, `wallettype_id` FROM `wallet` WHERE `customer_id`=\'' + customers_id + '\' ORDER BY wallettype_id ASC', [true], (err1,results1/*,fields*/) => {
                                if(err1){
                                    callback(null, {headercode : 400, message: err1.message, error :true});
                                    return context.succeed();
                                }
                                else{
                                    //console.log("result1 : " + JSON.stringify(results1));
                                    for (var i in results1) {
                                        var wallettype_id = results1[i].wallettype_id;
                                        if(wallettype_id == 1){
                                            walletBTCexist = true;
                                        }
                                        else if(wallettype_id == 3){
                                            walletXTZexist = true;
                                        }
                                    }
                                    if(walletBTCexist == true){
                                        //console.log("Wallet BTC Already exist");
                                        /*if(walletXTZexist == true){
                                            //console.log("Wallet XTZ Already exist");
                                            callback(null, {headercode:400, message:"Wallet BTC and XTZ Already exists", value: "",error:true});
                                        }
                                        else{
                                            CreateXTZWallet(connection);
                                        }*/
                                        callback(null, {headercode:400, message:"Wallet Already exists", value: "",error:true});
                                        return context.succeed();
                                    }
                                    else {
                                        //console.log("Wallet Not exist : "+ customers_id);
                                        CreateBTCWallet(connection);
                                    }
                                    
                                }
                            });
                        });
                    }
                    
                }
            }
        });
    });

    function CreateBTCWallet(connection){
        const data = JSON.stringify({
            id: username,
            passphrase: passphrase
        });
        const options = {
            hostname: 'api.ejara.io',
            method: 'POST',
            port: 4000,
            path: '/CreateBTCWallet',
            headers: {
              'Content-Type': 'application/json',
              'Content-Length': data.length
            }
        }
          
        const httpreq = http.request(options, (res) => {
            //console.log(`statusCode: ${res.statusCode}`)
            res.on('data', (d) => {
                //process.stdout.write(d)
                //console.log(d);
                //process.stdout.write(d);
                let tmp ='';
                tmp += d;
    
                tmp = JSON.parse(tmp);
                Mnemonic = tmp.value.mnemonic;
                //console.log("tmp : " + JSON.stringify(tmp.value.mnemonic));
                //console.log("tmp : " + Mnemonic);
                //console.log("tmp : " + JSON.parse(d));
                //console.log(JSON.stringify(res.body));
        
                let req = `INSERT INTO wallet (wallettype_id, customer_id, balance, wallet_date_creation, wallet_update_time, wallet_status_code, currency_code, frozenbalance) VALUES(?,?,?,?,?,?,?,?)`
                todo = [1, customers_id, 0, createtime, createtime, 1, 1, 1];
                pool.query(req, todo, (err, results) => {
                    if(err){
                        callback(null, {headercode:400, message: err.message, value: "", error:true});
                        return context.succeed();
                    }
                    console.log("BTC wallet create success");
                    if(!walletXTZexist){
                        CreateXTZWallet(connection);
                    }else{
                        callback(null,{headercode:200, message:"Wallet BTC Create success", value:{walletBTC : {mnemonic : Mnemonic}, walletXTZ : "" },error:false});
                        return context.succeed();
                    }
                    //response.send('Ok;' + username_id);
                });
            })
        })
          
        httpreq.on('error', (error) => {
            //console.error(error);
            console.log("BTC wallet create error");
            callback(null,{headercode:400, message: error.message, value: '', error:true});
            return context.succeed();
        })
          
        httpreq.write(data)
        httpreq.end()
    }
    
    function CreateXTZWallet(connection){
        const options = {
            hostname: 'api.ejara.io',
            method: 'GET',
            port: 4000,
            path: '/CreateXTZWallet'
        }
        
        const httpreq = http.request(options, (res) => {
            //console.log(`statusCode: ${res.statusCode}`)
            res.on('data', (d) => {
                //process.stdout.write(d);
                let tmp ='';
                tmp += d;
    
                tmp = JSON.parse(tmp);
                //Mnemonic = tmp.value.Mnemonic;
                
                //callback(null, "XTZ wallet create success : " + JSON.stringify(tmp));
    
                let publickeyhash = tmp.value.publickeyhash;
                let req = `INSERT INTO wallet (wallettype_id, customer_id, balance, wallet_date_creation, wallet_update_time, wallet_status_code, currency_code, frozenbalance, public_key_hash) VALUES(?,?,?,?,?,?,?,?,?)`
                var todo = [3, customers_id, 0, createtime, createtime, 1, 1, 1, publickeyhash];
                pool.query(req, todo, (err2, results/*,fields*/) => {
                    if(err2){
                        connection.release();
                        callback(null, {headercode:400, message: err2.message, value: "", error:true});
                    }
                    //console.log('Wallet XTZ create successfull');
                    //response.send('ok');
                    callback(null,{headercode:200, message:"Wallet BTC and XTZ Create success", value:{walletBTC : {mnemonic : Mnemonic}, walletXTZ : tmp.value},error:false});
                    return context.succeed();
                });
            })
        })
        
        httpreq.on('error', (error) => {
            //connection.release();
            console.log("XTZ wallet create error");
            callback(null,{headercode:400, message: error.message, value: '', error:true});
            return context.succeed();
        })
        
        //httpreq.write(data)
        httpreq.end()
    }
};