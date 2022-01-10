var http = require('http');var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

//Fiat : cfa
var convertionBTCtoFiat = 0;

exports.handler =  (event, context, callback) => {
    const username = event['username'];
    

    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //Check params
	if((username == "" || username == null)){
        callback(null, {headercode : 400, message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT `login` FROM `customers` WHERE `login`=\'' + username + '\'', function (error, results, fields) {
            // And done with the connection.
            connection.release();
            // Handle error after the release.
            if (error){
                //callback(error);
                callback(null, {headercode : 400, message: error.message, value : '', error :true});
            }
            else{
                if (results.length == 0){
                    callback(null, {headercode : 400, message: 'Incorrect username', value : '', error :true});
                }else{
                    
                    pool.query("SELECT cryptocode, usdprice, cfaprice, eurprice, usdcfasellprice FROM crypto_pricing WHERE cryptocode = 'BTC'", function (err, result, fields) {
                        
                        convertionBTCtoFiat = result[0].cfaprice
                        GetBalance();
                    });
                }
            }
        });
    });

    function GetBalance(){
        const data = JSON.stringify({
            id: username
        });
    
        const options = {
            hostname: 'api.ejara.io',
            method: 'GET',
            port: 4000,
            path: '/btcGetBalance',
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
                
                //console.log("tmp value : " + JSON.stringify(tmp))
                //console.log("options : " + JSON.stringify(options))
                
                tmp = JSON.parse(tmp);

                //convert satoshi to btc
                var btcbalance = tmp.confirmed / 100000000;

                //fiat value of crypto balance
                var btcfiatbalance = btcbalance * convertionBTCtoFiat;
    
                
                callback(null,
                    {
                        headercode:200, 
                        message:"Get BTC Balance success", 
                        value:{
                            BTC : { 
                                crypto : btcbalance,
                                fiat : btcfiatbalance
                            }
                        }, 
                        error:false
                    }    
                );
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


    
