var mysql = require('mysql');
var http = require('http');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

var customers_id = 0;

exports.handler =  (event, context, callback) => {
    const username = event['username'];
    const seed = event['seed'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);
    
    
    //Check params
	if((username == "" || username == null) || (seed == "" || seed == null)){
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
					RecoveryWalletz();
                }
            }
        });
    });

    function RecoveryWalletz(){
        const data = JSON.stringify({
            user : username,
            seed : seed
        });
    
        const options = {
            hostname: 'api.ejara.io',
            method: 'POST',
            port: 4000,
            path: '/XtzGetKeys',
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
                if(tmp.message == 'Invalid mnemonic length'){
                    callback(null,{headercode:400, message:"Invalid mnemonic length", value: '', error:true});
                }else if(tmp.message == 'Incorrect mnemonic'){
                    callback(null,{headercode:400, message:"Incorrect mnemonic", value: '', error:true});
                }else if(tmp.message == 'Recovery wallet success'){
                    
                    let req = `UPDATE wallet SET public_key_hash = ?, public_key = ? WHERE customer_id  = ? AND wallettype_id = ?`
                    let todo = [tmp.value.publickeyhash, null, customers_id, 3];
                    
                    console.log('UPDATE wallet SET public_key_hash =\'' + tmp.value.publickeyhash + '\', public_key =\'' + null + '\'  WHERE customer_id  = \'' + customers_id + '\' AND wallettype_id = 1')

                    pool.query(req, todo, (err,rows/*,fields*/) => {
                        if(err){
                            console.log(err.message);
                            callback(null,{headercode:400, message: err.message, value: '', error:true});
                            return ;
                        }
                        callback(null,{headercode:200, message:"Recovery wallet success", value: tmp.value, error:false});
                    });
                    
                }else{
                    callback(null,{headercode:400, message: tmp.message, value: '', error:true});
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