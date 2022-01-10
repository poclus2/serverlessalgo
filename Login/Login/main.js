var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    var username = event['username'];
    var password = event['password'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);
    
    
    //Check params
    if((username == "" || username == null) || (password == "" || password == null)){
        callback(null, {headercode : 400, message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT `login`, `customers_id`, `address_id`,`birthdaydate`, `lastname`, `firstname`, `pincode`, `email`, `mobilephone` FROM `customers` WHERE (login = \'' + username + '\' OR email = \'' + username + '\') AND password= \'' +  password + '\'', function (error, results, fields) {
            // And done with the connection.
            connection.release();
            // Handle error after the release.
            if (error){
                //callback(error);
                callback(null, {headercode : 400, message: error.message, value : '', error :true});
            }
            else{
                if (results.length == 0){
                    callback(null, {headercode : 400, message: 'Incorrect Username Or Password', value : '', error :true});
                }else{
                    //console.log('Data received from Db:\n');
					var lastname = results[0].lastname;
					var firstname = results[0].firstname;
					var pincode = results[0].pincode;
					var email = results[0].email;
					var mobilephone = results[0].mobilephone;
					//var seed_xtz = results[0].seed;
					var address_id = results[0].address_id;
					var birthday = results[0].birthdaydate;
					var customer_id = results[0].customers_id;
					var login = results[0].login;
					var country = null;
						
					if (lastname == null){
						lastname = 'null';
					}
					if (firstname == null){
						firstname = 'null';
					}
					if (pincode == null){
						pincode = 'null';
					}
					if (email == null){
						email = 'null';
					}
					if (mobilephone == null){
						mobilephone = 'null';
					}
						
					let req = 'SELECT `wallettype_id`, `public_key`, `public_key_hash`, `private_key` FROM `wallet` WHERE `customer_id` = ' +  customer_id;
					//console.log('SQL Login 1 : ' + req);

					pool.query(req, (err1, results1/*,fields*/) => {
						if(err1){
                            callback(null, {headercode : 400, message: error.message, value : '', error :true});
							return ;
						}
						else{
							var receiveaddress = null;
							var publickey_xtz = null;
							var publickeyhash_xtz = null;
							var privatekey_xtz = null;
							
							for (var i in results1) {
								var wallettype_id = results1[i].wallettype_id;
								
								if (wallettype_id == 1){
									receiveaddress = results1[i].public_key_hash;
								}
								else if (wallettype_id == 3){
									publickey_xtz = results1[i].public_key;
									publickeyhash_xtz = results1[i].public_key_hash;
									privatekey_xtz = results1[i].private_key;
								}
									
								if ( receiveaddress == null){
									receiveaddress = 'null';
								}
								if ( publickey_xtz == null){
									publickey_xtz = 'null';
								}
								if ( publickeyhash_xtz == null){
									publickeyhash_xtz = 'null';
								}
								if ( privatekey_xtz == null){
									privatekey_xtz = 'null';
								}
								
							}
								
							let requete = 'SELECT `Country_name`,`address_id` From `addresses` INNER JOIN `country` ON `addresses`.`Country_id` = `country`.`Country_id` WHERE `address_id`=' +  address_id;
								//console.log('SQL Login 2 : ' + requete);
								pool.query(requete, (error,row/*,fields*/) => {
									if(error){
                                        callback(null, {headercode : 400, message: error.message, value : '', error :true});
										return ;
									}
									else{
                                        country = row[0].Country_name;
                                        result = {
                                            username : login,
                                            pincode : pincode,
                                            email : email,
                                            phone : mobilephone,
                                            country : country,
                                            firstname : firstname,
                                            lastname : lastname,
                                            birthday : birthday,
                                            walletBTC : {
                                                receiveaddress : receiveaddress
                                            },
                                            walletXTZ : {
                                                publickeyhash : publickeyhash_xtz,
                                            }
                                        }
                                        
										//result = pincode + ";" + email + ";" + mobilephone + ";" + country + ";" + receiveaddress + ";" + publickey_xtz + ";" + publickeyhash_xtz + ";" + privatekey_xtz + ";" + firstname + ";" + lastname + ";" + birthday;
										//console.log('Post Titles: ', results[i].mobilephone);
                                        //response.send('Ok;' + result);
                                        
                                        callback(null, {headercode : 200, message: 'Login success', value : result, error :false});
											
										//console.log('Login [OK] for user : ' + login + '\n');
									}
								});
						}
					});
                }
            }
        });
    });
};