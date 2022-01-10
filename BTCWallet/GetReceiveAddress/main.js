var mysql = require('mysql');
var http = require('http');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    const username = event['username'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);
    var customers_id;
    
    
    //Check params
	if((username == "" || username == null)){
        callback(null, {headercode : 400, message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT `customers_id` FROM `customers` WHERE `login`=\'' + username + '\';', function (error, results, fields) {
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
					GetReceiveAddress();
                }
            }
        });
    });

    function GetReceiveAddress(){
        const data = JSON.stringify({
            id: username
        });
    
        const options = {
            hostname: 'api.ejara.io',
            method: 'GET',
            port: 4000,
            path: '/GetReceiveAddress',
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

                const receiveaddress = tmp.address;

                let req = `UPDATE wallet SET public_key_hash = ? WHERE customer_id  = ? AND wallettype_id = ?`
                let todo = [receiveaddress, customers_id, 1];
                
                //console.log('UPDATE wallet SET public_key_hash =\'' + receiveaddress + '\' WHERE customer_id  = \'' + customers_id + '\' AND wallettype_id = 1')

                pool.query(req, todo, (err,rows/*,fields*/) => {
                        if(err){
                            callback(null, {headercode : 400, message: error.message, value : '', error :true});
                            return ;
                        }
                        callback(null,{headercode:200, message:"Get receiveAddress success", value: tmp.address, error:false});
                });
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