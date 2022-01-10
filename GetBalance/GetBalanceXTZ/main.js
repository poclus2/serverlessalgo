var http = require('http');
var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

//Fiat : cfa
var convertionXTZtoFiat = 0;

exports.handler =  (event, context, callback) => {
    const publickeyhash = event['publickeyhash'];

    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //Check params
	if((publickeyhash == "" || publickeyhash == null)){
        callback(null, {headercode : 400, message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT `public_key_hash` FROM `wallet` WHERE `public_key_hash`=\'' + publickeyhash + '\'', function (error, results, fields) {
            // And done with the connection.
            connection.release();
            // Handle error after the release.
            if (error){
                //callback(error);
                callback(null, {headercode : 400, message: error.message, value : '', error :true});
            }
            else{
                if (results.length == 0){
                    callback(null, {headercode : 400, message: 'Incorrect address', value : '', error :true});
                }else{
                    pool.query("SELECT cryptocode, usdprice, cfaprice, eurprice, usdcfasellprice FROM crypto_pricing WHERE cryptocode = 'XTZ'", function (err, result, fields) {
                        convertionXTZtoFiat = result[0].cfaprice;
                        console.log("convertionXTZtoFiat : " + JSON.stringify(result))
                        GetBalance();
                    });
                }
            }
        });
    });

    function GetBalance(){
        const data = JSON.stringify({
            publickeyhash: publickeyhash
        });
    
        const options = {
            hostname: 'api.ejara.io',
            method: 'GET',
            port: 4000,
            path: '/XTZGetBalance',
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
                
                //console.log('data : ' + data);
                //console.log('options : ' + JSON.stringify(options));
                //console.log('tmp : ' + tmp);
    
                tmp = JSON.parse(tmp);

                //console.log('tmp 2: ' + tmp);
                
                if(tmp == ''){
                    callback(null,
                        {
                            headercode:200, 
                            message:"Get XTZ Balance success", 
                            value:{
                                XTZ : { 
                                    crypto : 0,
                                    fiat : 0
                                }
                            }, 
                            error:false
                        }
                    );
                }
                else{
                    //convert mXTZ to XTZ
                    var xtzbalance = tmp[0].balance / 1000000;
    
                    //fiat value of crypto balance
                    var xtzfiatbalance = xtzbalance * convertionXTZtoFiat;
                    
                    callback(null,
                        {
                            headercode:200, 
                            message:"Get XTZ Balance success", 
                            value:{
                                XTZ : { 
                                    crypto : xtzbalance,
                                    fiat : xtzfiatbalance
                                }
                            }, 
                            error:false
                        }    
                    );
                }
            })
        })
        
        httpreq.on('error', (error) => {
            //connection.release();
            callback(null,{headercode:400, message: error.message, value: '', error:true});
        })
        
        httpreq.write(data)
        httpreq.end()
    }
};


    
