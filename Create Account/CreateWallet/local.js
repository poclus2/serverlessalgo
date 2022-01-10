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

let username = 'SamTest138';
let passphrase = 'azdazdazdazdzdazdazd';
let createtime = getDateTime();


let customers_id = 0;

//Get Result BTC
let Mnemonic = '';
//Get result XTZ
let walletxtz;
    
var walletXTZexist = false;
var walletBTCexist = false;

pool.getConnection(function(err, connection) {
    //let login = event.login;
    //let email = event.email;
    //let mobilephone = event.mobilephone;

    // Use the connection
    pool.query('SELECT `customers_id` FROM `customers` WHERE `login`=\''+ username +'\'', function (error, results, fields) {
        // And done with the connection.
        //connection.release();
        // Handle error after the release.
        if (error) throw error;
        else {
            //console.log(JSON.stringify(results));
            if (results.length == 0){
                console.log('Bad Username');
            }else{
                customers_id = results[0].customers_id
                pool.query('SELECT `customer_id`, `wallettype_id` FROM `wallet` WHERE `customer_id`=\'' + customers_id + '\' ORDER BY wallettype_id ASC', [true], (err1,results1/*,fields*/) => {
                    if(err1){
                        response.send('error');
                        console.log(" E1 : " + err1.message);
                        return ;
                    }
                    else{
                        console.log("result1 : " + JSON.stringify(results1));
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
                            if(walletXTZexist == true){
                                //console.log("Wallet XTZ Already exist");
                                //response.send("Wallet Already Exist")
                                console.log({headercode:400, message:"Wallet BTC and XTZ Already exists", value: "",error:true});
                            }
                            else{
                                CreateXTZWallet(connection);
                            }
                        }
                        else {
                            console.log("Wallet Not exist : "+ customers_id);
                            CreateBTCWallet(connection);
                        }
                        
                    }
                });
            }
        };
        //process.exit();
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
        console.log(`statusCode: ${res.statusCode}`)
        res.on('data', (d) => {
            //process.stdout.write(d)
            //console.log(d);
            //process.stdout.write(d);
            let tmp ='';
            tmp += d;

            tmp = JSON.parse(tmp);
            Mnemonic = tmp.value.mnemonic;
            console.log("tmp : " + JSON.stringify(tmp.value.mnemonic));
            console.log("tmp : " + Mnemonic);
            //console.log("tmp : " + JSON.parse(d));
            //console.log(JSON.stringify(res.body));
    
            let req = `INSERT INTO wallet (wallettype_id, customer_id, balance, wallet_date_creation, wallet_update_time, wallet_status_code, currency_code, frozenbalance) VALUES(?,?,?,?,?,?,?,?)`
			todo = [1, customers_id, 0, createtime, createtime, 1, 1, 1];
			pool.query(req, todo, (err, results) => {
			    if(err){
					console.log(err.message);
					//response.send('error');
                    connection.release();
					return ;
                }
                if(!walletXTZexist){
                    CreateXTZWallet(connection)
                }else{
                    console.log({headercode:200, message:"Wallet BTC and XTZ Create success", value:{walletBTC : {mnemonic : Mnemonic}, walletXTZ : "" },error:false})
                }
				//response.send('Ok;' + username_id);
            });
        })
    })
      
    httpreq.on('error', (error) => {
        console.error(error);
        console.log({headercode:400, message:"Wallet can be create", value: '', error:true});
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
        console.log(`statusCode: ${res.statusCode}`)
        res.on('data', (d) => {
            //process.stdout.write(d);
            let tmp ='';
            tmp += d;

            tmp = JSON.parse(tmp);
            //Mnemonic = tmp.value.Mnemonic;

            let publickeyhash = tmp.value.publickeyhash;
            let req = `INSERT INTO wallet (wallettype_id, customer_id, balance, wallet_date_creation, wallet_update_time, wallet_status_code, currency_code, frozenbalance, public_key_hash) VALUES(?,?,?,?,?,?,?,?,?)`
            todo = [3, customers_id, 0, createtime, createtime, 1, 1, 1, publickeyhash];
            connection.query(req, todo, (err2, results/*,fields*/) => {
                if(err2){
                    console.log(" E2 : " + err2.message);
                    //response.send('error');
                    return ;
                }
                console.log('Wallet XTZ create successfull');
                //response.send('ok');
                console.log({headercode:200, message:"Wallet BTC and XTZ Create success", value:{walletBTC : {mnemonic : Mnemonic}, walletXTZ : tmp.value },error:false});

            });
        })
    })
    
    httpreq.on('error', (error) => {
        console.error(error);
        console.log({headercode:400, message:"Wallet can be create", value: '', error:true});
    })
    
    //httpreq.write(data)
    httpreq.end()
}