var mysql = require('mysql');
var config = require('./config');
var getDateTime = require('./date');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

let username = 'SamTest149';
let email = 'mikhaelkamdem45@gmail.com42';
let mobilephone = ' 2376916799932';
let country = '1';
let password = 'azdazdazdazdzdazdazd2';
let createtime = getDateTime();

pool.getConnection(function(err, connection) {
    //let login = event.login;
    //let email = event.email;
    //let mobilephone = event.mobilephone;

    // Use the connection
    pool.query('SELECT login, email, mobilephone from customers where login=\''+ username +'\' OR email=\'' + email +'\' OR mobilephone=\'' + mobilephone + '\'', function (error, results, fields) {
        // And done with the connection.
        //connection.release();
        // Handle error after the release.
        if (error) throw error;
        else {
            console.log(JSON.stringify(results));
            if (results.length > 0){
                console.log('Account already Exit');
            }else{
                console.log('Account can be create');
                createAccount();
            }
        };
        //process.exit();
    });
});

function createAccount(connection){
    let req = `INSERT INTO addresses (Country_id, Line1, Line2, State, Other_details) VALUES (?,?,?,?,?)`;
    let todo = [country, 1, 1, 'NULL', 'NULL'];
    pool.query(req, todo, (err,results/*,fields*/) => {
        if(err){
            console.log(err.message);
            //response.send('error');
            connection.release();
            return ;
        }
        // get inserted id
        address = results.insertId;
		req = `INSERT INTO customers (login, email, mobilephone, create_time, address_id, password, lastname, firstname, birthdaydate, status_id, accountlock, connectiontry) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)`;
		todo = [username, email, mobilephone, createtime, address, password, 'NULL', 'NULL', '2015-01-01', 1, '0', '0' ];
		pool.query(req, todo, (err, results/*,fields*/) => {
			if(err){
				console.log(err.message);
                //response.send('error');
                connection.release();
				return ;
			}
			//response.send('Ok;' + results.insertId);
			username_id = results.insertId;
            console.log('Wallet create successfull');

			/*req = `INSERT INTO wallet (wallettype_id, customer_id, balance, wallet_date_creation, wallet_update_time, wallet_status_code, currency_code, frozenbalance) VALUES(?,?,?,?,?,?,?,?)`
			todo = [1, username_id, 0, createtime, createtime, 1, 1, 1];
			pool.query(req, todo, (err, results/*,fields*//*) => {
			    /*if(err){
					console.log(err.message);
					//response.send('error');
                    connection.release();
					return ;
				}
				//response.send('Ok;' + username_id);
            });*/
        });
    });
}