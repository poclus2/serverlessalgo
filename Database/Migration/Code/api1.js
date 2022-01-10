const mysql = require('mysql');

// param mysql
let connection = mysql.createConnection({
                  host: 'localhost',
                  user: 'root',
                  password: '',
                  database: 'ejara_db'
                });

//get system time
function getDateTime() {

    var date = new Date();

    var hour = date.getHours();
    hour = (hour < 10 ? "0" : "") + hour;

    var min  = date.getMinutes();
    min = (min < 10 ? "0" : "") + min;

    var sec  = date.getSeconds();
    sec = (sec < 10 ? "0" : "") + sec;

    var year = date.getFullYear();

    var month = date.getMonth() + 1;
    month = (month < 10 ? "0" : "") + month;

    var day  = date.getDate();
    day = (day < 10 ? "0" : "") + day;

    return year + ":" + month + ":" + day + ":" + hour + ":" + min + ":" + sec;
}

//Recuperation des pays
function GetCountry(){
        connection.query('SELECT * FROM `country` WHERE 1', (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        return ;
                }
                else{
                        console.log('Country Get\n');

                        if (rows.length > 0){
                                var req = 'INSERT INTO country (Country_id, country_name, date_begin, date_update) VALUES (' + rows[0].country_id + ',?,?,?,?)';
                                for(var i=1; i< rows.length; i++){
                                        let req = `INSERT INTO addresses (Country_id, Line1, Line2, State, Other_details) VALUES (?,?,?,?,?)`;
                                        let todo = [country, 1, 1, 'NULL', 'NULL'];
                                        connection.query(req, todo, (err,results/*,fields*/) => {
                                                if(err){
                                                        console.log(err.message);
                                                        response.send('error');
                                                        return ;
                                                }
                                                // get inserted id
                                                address = results.insertId;
                                                                req = `INSERT INTO customers (login, email, mobilephone, create_time, address_id, password, lastname, firstname, birthdaydate, status_id, accountlock, connectiontry) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)`;
                                                                todo = [username, email, phonenumber, createtime, address, password, 'NULL', 'NULL', '2015-01-01', 1, '0', '0' ];
                                                                connection.query(req, todo, (err, results/*,fields*/) => {
                                                                        if(err){
                                                                                console.log(err.message);
                                                                                response.send('error');
                                                                                return ;
                                                                        }
                                                                        //response.send('Ok;' + results.insertId);
                                                                        username_id = results.insertId;

                                                                        req = `INSERT INTO wallet (wallettype_id, customer_id, balance, wallet_date_creation, wallet_update_time, wallet_status_code, currency_code, frozenbalance) VALUES(?,?,?,?,?,?,?,?)`
                                                                        todo = [1, username_id, 0, createtime, createtime, 1, 1, 1];
                                                                        connection.query(req, todo, (err, results/*,fields*/) => {
                                                                                if(err){
                                                                                                        console.log(err.message);
                                                                                                        response.send('error');
                                                                                                        return ;
                                                                                        }
                                                                                        response.send('Ok;' + username_id);
                                                                                        console.log('Wallet create successfull');
                                                        });
                                                });
                                        });
                                }
                        }
                }
        }); 
}


//--------mysql function------


app.get('/check_email', (request, response) => {
        const email1 = request.param('email');
        connection.query('SELECT `email` FROM `customers` WHERE `email`=\'' + email1 + '\'', [true], (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        return ;
                }
                else{
                        console.log('Data received from Db:\n');

                        if (rows.length > 0){
                                response.send('Email already exist')
                        }else{
                                response.send('Ok')
                        }
                }
        });
})

app.get('/check_username', (request, response) => {
        const username = request.param('username');
        connection.query('SELECT `login` FROM `customers` WHERE `login`=\'' + username + '\'', [true], (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        return ;
                }
                else{
                        console.log('Data received from Db:\n');

                        if (rows.length > 0){
                                response.send('Username already exist')
                        }else{
                                response.send('Ok')
                        }
                }
        });
})

app.get('/check_mobilephone', (request, response) => {
        const mobilephone = request.param('mobilephone');
        //console.log('SELECT `mobilephone` FROM `customers` WHERE `mobilephone`=\'' + mobilephone + '\'');
        connection.query('SELECT `mobilephone` FROM `customers` WHERE `mobilephone`=\'' + mobilephone + '\'', [true], (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        return ;
                }
                else{
                        //console.log('Data received from Db:\n');

                        if (rows.length > 0){
                                response.send('Mobilephone already exist')
                        }else{
                                response.send('Ok')
                        }
                }
        });
})

app.get('/login', (request, response) => {
        const login = request.param('login');
        const password = request.param('password');
        var result;

        //let req = 'SELECT `address_id`,`birthdaydate`, `lastname`, `firstname`, `pincode`, `email`, `mobilephone`, `receiveaddress`, `public_key`, `public_key_hash`, `private_key`, `seed` FROM `customers` JOIN wallet ON customers.customers_id = wallet.customer_id WHERE login = \'' + login + '\'  AND password= \'' +  password + '\' AND Wallettype_id=3';
        let req = 'SELECT `customers_id`, `address_id`,`birthdaydate`, `lastname`, `firstname`, `pincode`, `email`, `mobilephone` FROM `customers` WHERE login = \'' + login + '\'  AND password= \'' +  password + '\'';
		//console.log('SQL Login : ' + req);

        connection.query(req, (err,rows/*,fields*/) => {
            if(err){
                console.log(err.message);
				response.send('error');
                return ;
            }
            else{
				if (rows.length > 0){
					//console.log('Data received from Db:\n');
					var lastname = rows[0].lastname;
					var firstname = rows[0].firstname;
					var pincode = rows[0].pincode;
					var email = rows[0].email;
					var mobilephone = rows[0].mobilephone;
					//var seed_xtz = rows[0].seed;
					var address_id = rows[0].address_id;
					var birthday = rows[0].birthdaydate;
					var customer_id = rows[0].customers_id;
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

					connection.query(req, (err1, rows1/*,fields*/) => {
						if(err1){
							console.log(err1.message);
							response.send('error');
							return ;
						}
						else{
							var receiveaddress = null;
							var publickey_xtz = null;
							var publickeyhash_xtz = null;
							var privatekey_xtz = null;
							
							for (var i in rows1) {
								var wallettype_id = rows1[i].wallettype_id;
								
								if (wallettype_id == 1){
									receiveaddress = rows1[i].public_key_hash;
								}
								else if (wallettype_id == 3){
									publickey_xtz = rows1[i].public_key;
									publickeyhash_xtz = rows1[i].public_key_hash;
									privatekey_xtz = rows1[i].private_key;
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
								connection.query(requete, (error,row/*,fields*/) => {
									if(error){
										console.log(error.message);
										response.send('error');
										return ;
									}
									else{
										country = row[0].Country_name;
										result = pincode + ";" + email + ";" + mobilephone + ";" + country + ";" + receiveaddress + ";" + publickey_xtz + ";" + publickeyhash_xtz + ";" + privatekey_xtz + ";" + firstname + ";" + lastname + ";" + birthday;
										//console.log('Post Titles: ', rows[i].mobilephone);
										response.send('Ok;' + result);
											
										console.log('Login [OK] for user : ' + login + '\n');
									}
								});
						}
					});		
					//response.send('requete : ' + requete);
				}else{
					console.log('Login [Error] for user : ' + login + '\n');
					response.send('error');
				}
			}
        });
})

app.get('/create_account', (request, response) => {
        const username = request.param('username');
        const email = request.param('email');
        const country = request.param('country');
        const phonenumber = request.param('phone');
        const password = request.param('password');
        var address;
        var username_id;

        createtime = getDateTime();

        let req = `INSERT INTO addresses (Country_id, Line1, Line2, State, Other_details) VALUES (?,?,?,?,?)`;
        let todo = [country, 1, 1, 'NULL', 'NULL'];
        connection.query(req, todo, (err,results/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        response.send('error');
                        return ;
                }
                // get inserted id
                address = results.insertId;
				req = `INSERT INTO customers (login, email, mobilephone, create_time, address_id, password, lastname, firstname, birthdaydate, status_id, accountlock, connectiontry) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)`;
				todo = [username, email, phonenumber, createtime, address, password, 'NULL', 'NULL', '2015-01-01', 1, '0', '0' ];
				connection.query(req, todo, (err, results/*,fields*/) => {
					if(err){
						console.log(err.message);
						response.send('error');
						return ;
					}
					//response.send('Ok;' + results.insertId);
					username_id = results.insertId;

					req = `INSERT INTO wallet (wallettype_id, customer_id, balance, wallet_date_creation, wallet_update_time, wallet_status_code, currency_code, frozenbalance) VALUES(?,?,?,?,?,?,?,?)`
					todo = [1, username_id, 0, createtime, createtime, 1, 1, 1];
					connection.query(req, todo, (err, results/*,fields*/) => {
						   if(err){
									console.log(err.message);
									response.send('error');
									return ;
							}
							response.send('Ok;' + username_id);
							console.log('Wallet create successfull');
                });

        });
        });

        

})

app.post('/modify_profil', (request, response) => {
	
	
	//console.log('modify_profil');
	var post=request.body;
	
    const birthdaydate = request.param('birthdaydate');
    const email = request.param('email');
    const country = request.param('country');
    const phonenumber = request.param('phone');
    const firstname = request.param('firstname');
    const lastname = request.param('lastname');
    const login = request.param('login');

	let req = 'SELECT `address_id` FROM `customers` WHERE `login`=\'' + login + '\';';
	//console.log('request wallet-id :' + req);
	connection.query(req, (err, rows/*,fields*/) => {
		if(err){
			console.log(err.message);
			response.send('error');
			return;
		}
		let address_id = rows[0].address_id;
		let req = 'UPDATE addresses SET Country_id=\'' + country + '\' WHERE address_id=\''+ address_id +'\'';
		connection.query(req, (err, rows/*,fields*/) => {
			if(err){
				console.log(err.message);
				response.send('error');
				return;
			}
			//let req = 'UPDATE customers SET email='', lastname='', firstname='', mobilephone='', birthdaydate='' WHERE login=''';
			let req = 'UPDATE customers SET ';
				
			if(email != 'null'){
				req = req + 'email=\'' + email + '\', ';
			}
			if(birthdaydate != 'null'){
				req = req + 'birthdaydate=\'' + birthdaydate + '\', ';
			}
			if(firstname != 'null'){
				req = req + 'firstname=\'' + firstname + '\', ';
			}
			if(lastname != 'null'){
				req = req + 'lastname=\'' + lastname + '\', ';
			}
			if(phonenumber != 'null'){
				req = req + 'mobilephone=\'' + phonenumber + '\' ';
			}
				
			req = req + 'WHERE login=\''+ login +'\'';
			//console.log('request modify_profil : ' + req); 
				
				
			connection.query(req,(err,results/*,fields*/) => {
				if(err){
					console.log(err.message);
					response.send('error');
					return ;
				}
				response.send('Ok');
				console.log('Profil modify successfull');
			});
			
		});
	});
	

})

app.get('/save_transaction_nzinghaa_client', (request, response) => {
        const usernamesender = request.param('usernamesender');
        const usernamereceiver = request.param('usernamereceiver');
        const amount = request.param('amount');
        const transactionnote = request.param('transactionnote');
        const wallettype = request.param('wallettype');

        console.log('transactionnote : ' + transactionnote);

        createtime = getDateTime();
		let req = 'SELECT `wallettype_id` FROM `wallets_type` WHERE `Code`=\'' + wallettype + '\';';
		//console.log('request wallet-id :' + req);
		connection.query(req, (err, rows/*,fields*/) => {
			if(err){
				console.log(err.message);
				response.send('error');
				return ;
			}
			let wallettype_id = rows[0].wallettype_id;
			let req = 'SELECT `customers_id` FROM `customers` WHERE `login`=\'' + usernamesender + '\' OR `login`=\'' + usernamereceiver + '\' ';
			connection.query(req, (err, rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        response.send('error');
                        return ;
                }
                let idsender = rows[0].customers_id;
                let idreceiver = rows[1].customers_id;
                req = 'SELECT `wallet_id` FROM `wallet` WHERE `customer_id`=' + idsender + ' OR `customer_id`=' + idreceiver + ';';
                console.log('request wallet-id :' + req);
                connection.query(req, (err, rows/*,fields*/) => {
                    if(err){
                        console.log(err.message);
                        response.send('error');
                        return ;
                    }
                    let idwalletsender = rows[0].wallet_id;
                    let idwalletreceiver = rows[1].wallet_id;
                    req = `INSERT INTO transactions (wallettype_id, A_orderid, A_amount, A_commission, transaction_date, B_amount, B_commission, B_orderid, A_walletid, B_walletid, transaction_note) VALUES(?,?,?,?,?,?,?,?,?,?,?)`;
                    todo = [wallettype_id, idsender, amount, 0, createtime, 0, 0, idreceiver, idwalletsender, idwalletreceiver,  transactionnote];

                    connection.query(req, todo, (err, results/*,fields*/) => {
                        if(err){
                            console.log(err.message);
                            response.send('error');
                            return ;
                        }
                        response.send('Ok');
                        console.log('Transaction save');
                    });
				});
			});
        });
})

app.get('/save_transaction_not_nzinghaa_client', (request, response) => {
        const usernamesender = request.param('usernamesender');
        const namereceiver = request.param('namereceiver');
        const amount = request.param('amount');
                const phonenumber = request.param('phonenumber');
                const receiveraddress = request.param('receiveraddress');
        const transactionnote = request.param('transactionnote');
        const wallettype = request.param('wallettype');

        console.log('transactionnote : ' + transactionnote);
        createtime = getDateTime();
		
		let req = 'SELECT `wallettype_id` FROM `wallets_type` WHERE `Code`=\'' + wallettype + '\';';
		//console.log('request wallet-id :' + req);
		connection.query(req, (err, rows/*,fields*/) => {
			if(err){
				console.log(err.message);
				response.send('error');
				return ;
			}
			let wallettype_id = rows[0].wallettype_id;
			let req = 'SELECT `customers_id` FROM `customers` WHERE `login`=\'' + usernamesender + '\' ';
			connection.query(req, (err, rows/*,fields*/) => {
				if(err){
					console.log(err.message);
					response.send('error');
					return ;
				}
				let idsender = rows[0].customers_id;
				req = 'SELECT `wallet_id` FROM `wallet` WHERE `customer_id`=' + idsender + ';';
				console.log('request wallet-id :' + req);
				connection.query(req, (err, rows/*,fields*/) => {
					if(err){
						console.log(err.message);
						response.send('error');
						return ;
					}
					let idwalletsender = rows[0].wallet_id;
					req = `INSERT INTO transactions (wallettype_id, A_orderid, A_amount, A_commission, transaction_date, B_amount, B_commission, A_walletid, namereceiver, phonenumber, receiveaddress, transaction_note) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)`;
					todo = [wallettype_id, idsender, amount, 0, createtime, 0, 0, idwalletsender, namereceiver, phonenumber, receiveraddress, transactionnote];
					connection.query(req, todo, (err, results/*,fields*/) => {
						if(err){
							console.log('error:' +  err.message);
							response.send('error');
							return ;
						}
						response.send('Ok');
						console.log('Transaction save');
					});
				});
			});
		});
})

app.get('/save_buy_transaction', (request, response) => {
        const username = request.param('username');
        const receiveaddress = request.param('receiveaddress');
        //const mobilephone = request.param('mobilephone');
        const amount = request.param('amount');
        const wallettype = request.param('wallettype');
        const fiatmoney = request.param('fiatmoney');

        createtime = getDateTime();

	let req = 'SELECT `wallettype_id` FROM `wallets_type` WHERE `Code`=\'' + wallettype + '\' OR `Code`=\'' + fiatmoney + '\';';
        //console.log('request wallet-id :' + req);
        connection.query(req, (err, rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        response.send('error');
                        return ;
                }
                let wallettype_id = rows[0].wallettype_id;
                let fiatmoney_id = rows[1].wallettype_id;
                req = 'SELECT `customers_id`, `balance_cfa` FROM `customers` WHERE `login`=\'' + username + '\';';
                //console.log('request wallet-id :' + req);
                connection.query(req, (err, rows/*,fields*/) => {
                        if(err){
                                console.log(err.message);
                                response.send('error');
                                return ;
                        }
                        let customers_id = rows[0].customers_id;
                        let customers_balance_cfa = rows[0].balance_cfa;
                        if(customers_balance_cfa < amount){
                                response.send('error');
                                console.log('Buy Error : Poor balance')
                        }
                        else{
                                
                                req = `INSERT INTO buy (customers_id, receiveaddress, amount, transaction_date, statut, wallettype_id, wallettypefiat_id) VALUES(?,?,?,?,?,?,?)`;
                                todo = [customers_id, receiveaddress, amount, createtime, 0, wallettype_id, fiatmoney_id];
                                connection.query(req, todo, (err, results/*,fields*/) => {
                                        if(err){
                                        console.log('error:' +  err.message);
                                        response.send('error');
                                        return ;
                                        }
                                        //response.send('Ok');
                                        //console.log('Buy Transaction save');
                                                        req = `UPDATE customers SET balance_cfa = balance_cfa - ? WHERE customers_id = ?`;
                                                        todo = [amount, customers_id];
                                                        connection.query(req, todo, (err, results/*,fields*/) => {
                                                                if(err){
                                                                        console.log('error:' +  err.message);
                                                                        response.send('error');
                                                                        return ;
                                                                }
                                                                response.send('Ok');
                                                                console.log('Buy Transaction save');
                                                        });
                                });   
                        }
        
                });
	});
})

app.get('/Get_buy_transaction', (request, response) => {

        let username=request.param('username')
    //console.log('resquest : ' + request;

    req = 'SELECT `customers_id` FROM `customers` WHERE `login`=\'' + username + '\';';
    //console.log('request wallet-id :' + req);
    connection.query(req, (err, rows/*,fields*/) => {
        if(err){
            console.log(err.message);
            response.send('error');
            return ;
        }
        let customers_id = rows[0].customers_id;
                let sql = 'SELECT amount, transaction_date, transaction_id, statut FROM buy WHERE customers_id=' + customers_id + ';';

                //console.log('contact : ' + post.contact);
                connection.query(sql, (err,rows/*,fields*/) => {
                        if(err){
                                console.log(err.message);
                                response.send('Null');
                                return ;
                        }

                        var reti = new Array;
                        var result = '';
                        for (var i in rows) {
                                var Amount = rows[i].amount;
                                var Date = rows[i].transaction_date;
                                var TransactionID = rows[i].transaction_id;
                                var Statut = rows[i].statut;
                                var ret =
                                        [
                                        count =
                                                {
                                                amount: Amount,
                                                date: Date,
                                                transactionid: TransactionID,
                                                statut: Statut,
                                                },
                                        ];
                                reti.push(ret);
                        }

                        var jsonret = JSON.stringify(reti);

                        //const test = Object.values(result)[0].height;
                        console.log(reti);
                        response.json(reti)

                });
        });
})

const https = require('https');
let todo2 =[];
app.get('/save_add_transaction', (reqs, response) => {
        console.log('je suis dans route ');
        const username = reqs.param('username');
        const identification = reqs.param('identification');
        //const mobilephone = request.param('mobilephone');
        const amount = reqs.param('amount');
        const addsourcetype = reqs.param('addsourcetype');
        console.log(identification);
        createtime = getDateTime();
    
        console.log(" start of the saving");
    
    
    
    
        req = 'SELECT `customers_id` FROM `customers` WHERE `login`=\'' + username + '\';';
        //console.log('request wallet-id :' + req);
        connection.query(req, (err, rows/*,fields*/) => {
            if(err){
                console.log(err.message);
                response.send('error');
                return ;
            }
            let customers_id = rows[0].customers_id;
    
            let req1 = 'INSERT INTO add (customers_id, identification, amount, transaction_date, statut, add_source_type_id) VALUES(' + customers_id + ',\''+ identification +'\','+ amount + ',\''+ createtime+ '\',0, \''+ addsourcetype +'\')';
    
            console.log('test request : ' + req1);
    
            req = `INSERT INTO addmoney (customers_id, identification, amount, transaction_date, statut, add_source_type_id) VALUES(?,?,?,?,?,?)`;
            todo = [customers_id, identification, amount, createtime, 0, addsourcetype];
            connection.query(req, todo, (err, results/*,fields*/) => {
                if(err){
                    console.log('error:' +  err.message);
                    response.send('error');
                    return ;
                }
    
    
    
                const data = JSON.stringify({
                    amount: amount,
                    phonenumber: identification,
                    service:'bFhwL6Hfv48gyi9ZdxlcrtJ177vgXQFw'
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
    
                    let  reqlastid = 'SELECT transaction_id FROM addmoney ORDER BY transaction_id DESC LIMIT 1' ;
                    connection.query(reqlastid, (err, rows/*,fields*/) => {
                        if(err){
                            console.log(err.message);
                            response.send('error');
                            return ;
                        }
                        let transId = rows[0].transaction_id;
                        console.log(transId);
                        let  insertbilr = `INSERT INTO bilresponse (message,paymentId,status,channel,transactionId) VALUES(?,?,?,?,?)`;
                        console.log('avant le status je verifie encore le contenue de mon tableau')
                        console.log(`statusCode: ${res.message}`);
    console.log(todo2);
                        todo2.push(transId);
                        console.log(todo2);
                        console.log('structure de la req monebil ok');
                        connection.query(insertbilr, todo2, (err, results/*,fields*/) => {
                            console.log('enregitrement de la req monebil ');
                            if(err){
                                console.log('il y a une erreur');
                                console.log('error:' +  err.message);
                                response.send('error');
                                return ;
                            }
                            console.log(results);
    
    // derniere etape modifier en fonction du status
                          console.log(' debut conditition ')
                            if(todo2[2]==="REQUEST_ACCEPTED"){
                                console.log('conditition accepted')
                                let updatestate = 'UPDATE addmoney SET statut=\'' + 0 + '\' WHERE transaction_id=\''+ todo2[4] +'\''
    
                                connection.query(updatestate, (err, results/*,fields*/) => {
                                    console.log('enregitrement de la req monebil ');
                                    if(err){
                                        console.log('il y a une erreur');
                                        console.log('error:' +  err.message);
                                        response.send('error');
                                        return ;
                                    }
                                });
    
                            }else{
                                console.log('condition 2 cancelled')
                                let updatestate = 'UPDATE addmoney SET statut=\'' + 2 + '\' WHERE transaction_id=\''+ todo2[4] +'\''
    
                                connection.query(updatestate, (err, results/*,fields*/) => {
                                    console.log('enregitrement de la req monebil ');
                                    if(err){
                                        console.log('il y a une erreur');
                                        console.log('error:' +  err.message);
                                        response.send('error');
                                        return ;
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
    
                req.end()
                //response.send('Ok');
                //console.log('Buy Transaction save');
                response.send('Ok');
                console.log('Add Transaction save');
    
    
            });
        });
    
    
    
    
    
    
    
    
    
    
    });
    
app.get('/Get_add_transaction', (request, response) => {

        let username=request.param('username')
    //console.log('resquest : ' + request;

    req = 'SELECT `customers_id` FROM `customers` WHERE `login`=\'' + username + '\';';
    //console.log('request wallet-id :' + req);
    connection.query(req, (err, rows/*,fields*/) => {
        if(err){
            console.log(err.message);
            response.send('error');
            return ;
        }
        let customers_id = rows[0].customers_id;
                let sql = 'SELECT amount, transaction_date, transaction_id, statut FROM addmoney WHERE customers_id=' + customers_id + ';';

                console.log('sql request : ' + sql);
                connection.query(sql, (err,rows/*,fields*/) => {
                        if(err){
                                console.log(err.message);
                                response.send('Null');
                                return ;
                        }

                        var reti = new Array;
                        var result = '';
                        for (var i in rows) {
                                var Amount = rows[i].amount;
                                var Date = rows[i].transaction_date;
                                var TransactionID = rows[i].transaction_id;
                                var Statut = rows[i].statut;
                                var ret =
                                        [
                                        count =
                                                {
                                                amount: Amount,
                                                date: Date,
                                                transactionid: TransactionID,
                                                statut: Statut,
                                                },
                                        ];
                                reti.push(ret);
                        }

                        var jsonret = JSON.stringify(reti);

                        //const test = Object.values(result)[0].height;
                        console.log(reti);
                        response.json(reti)

                });
        });
})

app.get('/set_pincode', (request, response) => {
        const userid = request.param('id');
        const pincode = request.param('pincode');

        let sql = `UPDATE customers
           SET pincode = ?
           WHERE customers_id = ?`;
        let data = [pincode, userid];

        connection.query(sql, data, (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        response.send('error');
                        return ;
                }
                response.send('Ok');
        });
})

app.get('/getbtcinfo', function(req,res)
{
        getbtcinfo().catch(console.error.bind(console));
        async function getbtcinfo()
        {
		connection.connect(function(err) {

        connection.query("SELECT usdprice, cfaprice, eurprice, usdcfasellprice FROM crypto_pricing WHERE cryptocode = 'BTC'", function (err, result, fields) {
          console.log(result);
          res.json(result);
        });
      });
}
});

app.get('/getxlminfo', function(req,res)
{
        getxlminfo().catch(console.error.bind(console));
        async function getxlminfo()
        {
        connection.connect(function(err) {

        connection.query("SELECT usdprice, cfaprice, eurprice, usdcfasellprice FROM crypto_pricing WHERE cryptocode = 'XLM'", function (err, result, fields) {
          console.log(result);
          res.json(result);
        });
      });
        }
});

app.get('/getxtzinfo', function(req,res)
{
        getxtzinfo().catch(console.error.bind(console));
        async function getxtzinfo()
        {
        connection.connect(function(err) {
		connection.query("SELECT usdprice, cfaprice, eurprice, usdcfasellprice FROM crypto_pricing WHERE cryptocode = 'XTZ'", function (err, result, fields) {

        console.log(result);
        res.json(result);
        });
      });
}
});

app.get('/set_receiveaddress', (request, response) => {
    const username = request.param('username');
    const receiveaddress = request.param('receiveaddress');
		
	connection.query('SELECT `customers_id` FROM `customers` WHERE `login`=\'' + username + '\'', [true], (err,rows/*,fields*/) => {
        if(err){
            console.log(err.message);
            return ;
        }
        else{
            let customers_id;
            for (var i in rows) {
                customers_id = rows[i].customers_id;
                //console.log('Customers_id: ', rows[i].customers_id);
            }
		
			/*let sql = `UPDATE customers
			   SET receiveaddress = ?
			   WHERE login = ?`;*/
			//let data = [receiveaddress, username];
			   
            let req = `UPDATE wallet SET public_key_hash = ? WHERE customer_id  = ? AND wallettype_id = ?`
            let todo = [receiveaddress, customers_id, 1];
			
			//console.log('UPDATE wallet SET public_key_hash =\'' + receiveaddress + '\' WHERE customer_id  = \'' + customers_id + '\' AND wallettype_id = 1')

			connection.query(req, todo, (err,rows/*,fields*/) => {
					if(err){
							console.log(err.message);
							response.send('error');
							return ;
					}
					response.send('Ok');
			});
		}
	});
})

app.get('/get_password', (request, response) => {
        const username = request.param('username');
        var result;
        connection.query('SELECT `password` FROM `customers` WHERE `login`=\'' + username + '\'', [true], (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        return ;
                }
                else{
                        //console.log('Data received from Db:\n');
                        for (var i in rows) {
                                result = rows[i].password;
                                //console.log('Post Titles: ', rows[i].mobilephone);
                        }
                        response.send(result);
                }
        });
})

app.get('/get_services_api', (request, response) => {
        const login = request.param('login');
        var result;
        connection.query('SELECT `service_port`,`service_name`,`service_code`,`service_url`,`service_active` FROM `appservices`', [true], (err,rows/*,fields*/) => {
                if(err){
                        console.log('Error 1 : ' + err.message);
			response.send([{message:'Error getting param', value : 'error', error :true}]);
                        return ;
                }
	        //console.log('Result : ' + rows);
                //response.send(rows);
                connection.query('SELECT `login`, `status_id` FROM `customers` WHERE login = \'' + login + '\'', [true], (err1,rows1/*,fields*/) => {
                        if(err1){
                                console.log('Error 2 : ' + err1.message);
                                response.send([{message:'Error getting param', value : 'error', error :true}]);
                                return ;
                        }
                        //console.log('Result : ' + rows);
                        //response.send(rows1);
                        
                        var reti = new Array;
                        
                        
                        var accountLock = rows1[0].status_id;
                        var ret =
                                count =
                                {
                                        account: login,
                                        statut: accountLock,
                                };
                        reti.push(ret);

                        //const test = Object.values(result)[0].height;
                        //console.log(reti);
                        //response.json(reti)   

                        if (rows1[0].status_id == 0){
                                //Account bloqué
                                response.json(reti)     
                        }
                        else if(rows1[0].status_id == 1){
                                connection.query('SELECT `customers`.`login`, `appservices`.`service_code`, `statut` FROM `blockeduser` INNER JOIN `appservices` ON `blockeduser`.`appservices_id` = `appservices`.`appservices_id` INNER JOIN `customers` ON `blockeduser`.`customers_id` = `customers`.`customers_id` WHERE `blockeduser`.`statut` = 1 AND `customers`.`login` = \'' + login + '\'', [true], (err2,rows2/*,fields*/) => {
                                        if(err2){
                                                console.log('Error 3 : ' + err2.message);
                                                response.send([{message:'Error getting param', value : 'error', error :true}]);
                                                return ;
                                        }
                                        //console.log('Result : ' + rows);
                                        //response.send(rows1);
                                        if (rows1.length == 0){
                                                for (var i in rows) {
                                                        var servicePort = rows[i].service_port;
                                                        var serviceName = rows[i].service_name;
                                                        var serviceCode = rows[i].service_code;
                                                        var serviceUrl = rows[i].service_url;
                                                        var serviceActive = rows[i].service_active;
                                                        var ret =
                                                                count =
                                                                {
                                                                        service_port: servicePort,
                                                                        service_name: serviceName,
                                                                        service_code: serviceCode,
                                                                        service_url: serviceUrl,
                                                                        service_active: serviceActive,
                                                                };
                                                        reti.push(ret);
                                                }

                                                var jsonret = JSON.stringify(reti);
                                                response.json(reti)    
                                        }
                                        else{
                                                for (var i in rows) {
                                                        
                                                        var servicePort = rows[i].service_port;
                                                        var serviceName = rows[i].service_name;
                                                        var serviceCode = rows[i].service_code;
                                                        var serviceUrl = rows[i].service_url;
                                                        var serviceActive = rows[i].service_active;
                                                        var serviceCodeUser;
                                                        //1 pour service debloqué
                                                        var serviceStatutuser = 1;
                                                        for (var i in rows2) {
                                                                var serviceCodeUser = rows2[i].service_code;
                                                                //var serviceStatutuser = rows2[i].statut;
                                                                if(serviceCode == serviceCodeUser){
                                                                        serviceStatutuser = rows2[i].statut;
                                                                        //Ici on inverse la logique renvoyé par la table blockeduser: 1: Bloqué, 0: debloqué
                                                                        //Pour la rendre conforme a celle des autres données 0: inatif, 1: actif
                                                                        if(serviceStatutuser == 1){
                                                                                serviceStatutuser = 0;
                                                                        }
                                                                        else if(serviceStatutuser == 0){
                                                                                serviceStatutuser = 1;
                                                                        }
                                                                        //console.log('Servicestatutuser : ' + serviceStatutuser + ", base statut : " + rows2[i].statut);
                                                                }
                                                        }
                                                        var ret =
                                                                count =
                                                                {
                                                                        service_port: servicePort,
                                                                        service_name: serviceName,
                                                                        service_code: serviceCode,
                                                                        service_url: serviceUrl,
                                                                        service_active: serviceActive,
                                                                        service_active_for_user: serviceStatutuser,
                                                                };
                                                        reti.push(ret);
                                                }

                                                var jsonret = JSON.stringify(reti);
                                                response.json(reti)   
                                        }
                                });
                        }
                        else{
                                response.json(reti)       
                        }
                });
        });
})

app.get('/get_api_fees', (request, response) => {
        var result;
        connection.query('SELECT `service_port`,`service_name`,`service_code`,`service_url`,`service_active` FROM `appservices`', [true], (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
						response.send({message:'ok', value : 'error', error :true});
                        return ;
                }
                else{
					console.log('Result : ' + rows);
                    response.send(rows);
                }
        });
})

app.get('/get_balance_cfa', (request, response) => {
        const login = request.param('login');
        var result;
        connection.query('SELECT `balance_cfa` FROM `customers` WHERE `login`=\'' + login + '\'', [true], (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        return ;
                }
                else{
                        //console.log('Data received from Db:\n');
                        for (var i in rows) {
                                result = rows[i].balance_cfa;
                                //console.log('Post Titles: ', result);
                        }
                        response.send('ok;' + result);
                }
        });
})

app.get('/get_balance_tezos', (request, response) => {
        const login = request.param('login');
        var result;
        connection.query('SELECT `balance_xtz` FROM `customers` WHERE `login`=\'' + login + '\'', [true], (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        return ;
                }
                else{
                        //console.log('Data received from Db:\n');
                        for (var i in rows) {
                                result = rows[i].balance_xtz;
                                //console.log('Post Titles: ', result);
                        }
                        response.send('ok;' + result);
                }
        });
})

app.get('/get_username_and_receiveaddress_from_mobilephone', (request, response) => {
        const mobilephone = request.param('mobilephone');
        var result;
        connection.query('SELECT `login`, `receiveaddress` FROM `customers` WHERE `mobilephone` like \'%' + mobilephone + '\' OR `mobilephone`=\'' + mobilephone + '\'', [true], (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        return ;
                }
                else{
                        //console.log('Data received from Db:\n');
                        for (var i in rows) {
                                result = rows[i].login + ';' + rows[i].receiveaddress;
                                //console.log('Post Titles: ', rows[i].mobilephone);
                        }
						if (rows.length > 0){
								response.send(result);
						}else{
								response.send('Null')
						}
                        //response.send(result);
                }
        });
})

app.get('/get_receiveAddress_from_username', (request, response) => {
        //console.log('resquest : ' + request;
        const username = request.param('username');
        let sql = 'SELECT `login`, `public_key_hash` FROM customers '
					+ 'JOIN wallet '  
					+ 'ON wallet.`customer_id` = customers.customers_id WHERE `login` = \'' + username + '\' AND wallettype_id=1;';
        //console.log('contact : ' + post.contact);
        console.log('request : ' + sql);
        connection.query(sql, (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        response.send('Null');
                        return ;
                }
                var result = '';
                for (var i in rows) {
                        result = rows[i].login + ';' + rows[i].public_key_hash;
                        //console.log('Post Titles: ', rows[i].mobilephone);
                }
                if (rows.length > 0){
                        response.send(result);
                }else{
                        response.send('Null')
                }
        });
})

app.get('/get_publickey_from_username', (request, response) => {
        //console.log('resquest : ' + request;
        const username = request.param('username');
        let sql = 'SELECT `login`, `public_key_hash` FROM customers '
					+ 'JOIN wallet '  
					+ 'ON wallet.`customer_id` = customers.customers_id WHERE `login` = \'' + username + '\' AND wallettype_id=3;';
        //console.log('contact : ' + post.contact);
        console.log('request : ' + sql);
        connection.query(sql, (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        response.send('Null');
                        return ;
                }
                var result = '';
                for (var i in rows) {
                        result = rows[i].login + ';' + rows[i].public_key_hash;
                        //console.log('Post Titles: ', rows[i].mobilephone);
                }
                if (rows.length > 0){
                        response.send(result);
                }else{
                        response.send('Null')
                }
        });
})

app.post('/check_nzinghaa_user', (request, response) => {
        //console.log('resquest : ' + request;
        var post=request.body;
        let sql = 'SELECT mobilephone FROM customers WHERE mobilephone LIKE \'%';
        //console.log('contact : ' + post.contact);
        var PhoneNumber = post.contact.split(';');
        for(var i=0; i<PhoneNumber.length; i++) {
                if (i < PhoneNumber.length - 1){
                        sql = sql + PhoneNumber[i] + '\' OR mobilephone=\'' + PhoneNumber[i] + '\' OR mobilephone LIKE \'%';
                }
                else{
                        sql = sql + PhoneNumber[i] + '\' OR mobilephone=\'' + PhoneNumber[i] + '\';';
                }
        }
        console.log('request : ' + sql);
        connection.query(sql, (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        response.send('Null');
                        return ;
                }
                var result = '';
                for (var i in rows) {
                        result = result + rows[i].mobilephone + ';';
                        //console.log('Post Titles: ', rows[i].mobilephone);
                }
                if (rows.length > 0){
                        response.send(result);
                }else{
                        response.send('Null')
                }
        });

})

app.post('/check_username_from_transaction_list_btc', (request, response) => {
        //console.log('resquest : ' + request;
        var post=request.body;
        let sql = 'SELECT `login`, `public_key_hash` FROM customers '
					+ 'JOIN wallet '  
					+ 'ON wallet.`customer_id` = customers.customers_id WHERE (`public_key_hash` = \'';
        //console.log('contact : ' + post.contact);
        var ReceiveAddress = post.receiveaddress.split(';');
        for(var i=0; i< ReceiveAddress.length; i++) {
                if (i < ReceiveAddress.length - 1){
                        sql = sql + ReceiveAddress[i] + '\' OR `public_key_hash`=\'';
                }
                else{
                        sql = sql + ReceiveAddress[i] + '\') AND wallettype_id=1;';
                }
        }
        console.log('request : ' + sql);
        connection.query(sql, (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        response.send('Null');
                        return ;
                }
                var result = '';
                for (var i in rows) {
                        result = result + rows[i].login + ':' + rows[i].public_key_hash + ';';
                        //console.log('Post Titles: ', rows[i].mobilephone);
                }
                if (rows.length > 0){
                        response.send(result);
                }else{
                        response.send('Null')
                }
        });
})

app.post('/check_username_from_transaction_list_xtz', (request, response) => {
        //console.log('resquest : ' + request;
        var post=request.body;
        let sql = 'SELECT `login`, `public_key_hash` FROM customers '
					+ 'JOIN wallet '  
					+ 'ON wallet.`customer_id` = customers.customers_id WHERE (`public_key_hash` = \'';
        //console.log('contact : ' + post.contact);
        var ReceiveAddress = post.publickeyhash.split(';');
        for(var i=0; i< ReceiveAddress.length; i++) {
                if (i < ReceiveAddress.length - 1){
                        sql = sql + ReceiveAddress[i] + '\' OR `public_key_hash`=\'';
                }
                else{
                        sql = sql + ReceiveAddress[i] + '\') AND wallettype_id=3;';
                }
        }
        console.log('request : ' + sql);
        connection.query(sql, (err,rows/*,fields*/) => {
                if(err){
                        console.log(err.message);
                        response.send('Null');
                        return ;
                }
                var result = '';
                for (var i in rows) {
                        result = result + rows[i].login + ':' + rows[i].public_key_hash + ';';
                        //console.log('Post Titles: ', rows[i].mobilephone);
                }
                if (rows.length > 0){
                        response.send(result);
                }else{
                        response.send('Null')
                }
        });
})

app.post('/save_xtz_wallet_info', (request, response) => {
    var post=request.body;
		
    var username = post.username;
    var publickey = post.publickey;
    //var privatekey = post.privatekey;
    var publickeyhash = post.publickeyhash;
	
	//console.log('Resquest : ' + 'SELECT `customers_id` FROM `customers` WHERE `login`=\'' + username + '\'');
	connection.query('SELECT `customers_id` FROM `customers` WHERE `login`=\'' + username + '\'', [true], (err,rows/*,fields*/) => {
        if(err){
            response.send('error save XTZ 1');
            console.log(" E1 : " + err.message);
            return ;
        }
        else{
            let customers_id;
            for (var i in rows) {
                customers_id = rows[i].customers_id;
                //console.log('Customers_id: ', rows[i].customers_id);
            }

       		createtime = getDateTime();

           	req = `INSERT INTO wallet (wallettype_id, customer_id, balance, wallet_date_creation, wallet_update_time, wallet_status_code, currency_code, frozenbalance, public_key, public_key_hash) VALUES(?,?,?,?,?,?,?,?,?,?)`
          	todo = [3, customers_id, 0, createtime, createtime, 1, 1, 1, publickey, publickeyhash];
           	connection.query(req, todo, (err, results/*,fields*/) => {
           		if(err){
                	console.log(" E1 : " + err.message);
                   	response.send('error save XTZ 2');
                  	return ;
               	}
               	response.send('ok');
               	console.log('Wallet create successfull');
           	});
        }
    });
})

app.post('/send_log', (request, response) => {
        //console.log('resquest : ' + request;
        var post=request.body
        console.log('contact : ' + post.log);

                if(!fs.existsSync("./log")){
                        fs.mkdirSync("./log", 0777, function(err){
                                if(err){
                                        console.log(err);
                                        // echo the result back
                                        response.send("ERROR! Can\'t make the directory! n");
                                }
				console.log('test');
                                fs.writeFile('./log/' + post.detail + '.log', post.log , function (err) {
                                        if (err){
                                                response.send("Error");
                                        };
                                        console.log('log saved!');
                                });
                        });
                }else{
                        fs.writeFile('./log/' + post.detail + '.log', post.log , function (err) {
                                if (err) throw err;
                                console.log('log saved!');
                        });
                }
})

app.get('/userid', function (req, res) {
  
        let user_id = req.param('id');
      
        if (!user_id) {
            return res.status(400).send({ error: true, message: 'Please provide user_id' });
        }
      
        connection.query('SELECT `customers`.`login`,`customers`.`email`,`customers`.`mobilephone`,`country`.`Country_name`,`customers`.`state`,`customers`.`lastname`,`customers`.`firstname`,`customers`.`birthdaydate` FROM `customers`,`addresses`,`country` WHERE (`customers`.`address_id`=`addresses`.`address_id`)AND (`addresses`.`Country_id`=`country`.`Country_id`)AND(`customers`.`login`=?)', user_id, function (error, results, fields) {
            if (error) throw error;
            return res.send({ error: false, data: results[0], message: 'users list.' });
        });
      
    });

//-------------------Server Listening --------------------------------
//app.listen(3000)
app.listen(port, (err) => {
  if (err) {
    return console.log('An Error Occured.', err)
  }

  console.log(`server is listening on ${port}`)
})


