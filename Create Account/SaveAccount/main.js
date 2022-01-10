var mysql = require('mysql');
var config = require('./config.json');
var getDateTime = require('./date');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
    let username = event.username;
    let email = event.email;
    let phone = event.phone;
    let country = event.country;
    let password = event.password;
    let createtime = getDateTime();
    
    //prevent timeout from waiting event loop//prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;
    
    //callback(null, username);
    //Check params
    if((username == "" || username == null) || (email == "" || email == null) || (phone == "" || phone == null)
        || (country == "" || country == null) || (password == "" || password == null)){
        callback(null, {headercode : 400, message: 'Missing arguments', error :true});
    }

    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT login, email, mobilephone from customers where login=\''+ username +'\' OR email=\'' + email +'\' OR mobilephone=\'' + phone + '\'', function (error, results, fields) {
            // Handle error after the release.
            if (error){
                callback(null, {headercode : 400, message: error.message, error :true})
            }
            else{
                if (results.length > 0){
                    //callback(null,results[0].login);
                    callback(null,{headercode : 400, message: 'Account already exist', value : '', error :true});
                    //console.log('Account already Exit');
                }else{
                    createAccount();
                }
            }
        });
    });

    function createAccount(connection){
        let req = `INSERT INTO addresses (Country_id, Line1, Line2, State, Other_details) VALUES (?,?,?,?,?)`;
        let todo = [country, 1, 1, 'NULL', 'NULL'];
        pool.query(req, todo, (err,results/*,fields*/) => {
            if(err){
                connection.release();
                callback(null, {headercode : 400, message: err.message, value : '', error :true})
                return ;
            }
            // get inserted id
            var address = results.insertId;
		    req = `INSERT INTO customers (login, email, mobilephone, create_time, address_id, password, lastname, firstname, birthdaydate, status_id, accountlock, connectiontry, kyc) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)`;
		    todo = [username, email, phone, createtime, address, password, 'NULL', 'NULL', '2015-01-01', 1, '0', '0', '1'];
    		pool.query(req, todo, (err1, results1/*,fields*/) => {
	    		if(err1){
		    		//console.log(err1.message);
                    //response.send('error');
                    callback(null, {headercode : 400, message: err1.message, value : '', error :true})
                    connection.release();
				    return ;
		    	}
			    //response.send('Ok;' + results.insertId);
			    var username_id = results1.insertId;
                callback(null, {headercode : 200, message: 'Account create success', value : {userid : username_id}, error :false})
            });
        });
    }
};