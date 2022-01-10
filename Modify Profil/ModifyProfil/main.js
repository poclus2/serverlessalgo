var mysql = require('mysql');
var config = require('./config.json');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

exports.handler =  (event, context, callback) => {
	
    const birthday = event['birthday'];
    const country = event['country'];
    const phone = event['phone'];
    const firstname = event['firstname'];
    const lastname = event['lastname'];
    const username = event['username'];
    //var json = JSON.parse(event.body);
    //prevent timeout from waiting event loop
    context.callbackWaitsForEmptyEventLoop = false;

    //callback(null, event);
    
    
    //Check params
	if((username == "" || username == null) || (lastname == "" || lastname == null) || (firstname == "" || firstname == null)
		|| (phone == "" || phone == null) || (country == "" || country == null) || (birthday == "" || birthday == null)){
        callback(null, {headercode : 400, message: 'Missing arguments', value : '', error :true});
    }
    
    pool.getConnection(function(err, connection) {
        // Use the connection
        connection.query('SELECT `address_id` FROM `customers` WHERE `login`=\'' + username + '\';', function (error, results, fields) {
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
					let address_id = results[0].address_id;
					let req = 'UPDATE addresses SET Country_id=\'' + country + '\' WHERE address_id=\''+ address_id +'\'';
					//console.log('SQL Login 1 : ' + req);

					pool.query(req, (err1, results1/*,fields*/) => {
						if(err1){
                            callback(null, {headercode : 400, message: error.message, value : '', error :true});
							return ;
						}
						else{
							let req = 'UPDATE customers SET ';
							if(birthday != 'null'){
								req = req + 'birthdaydate=\'' + birthday + '\', ';
							}
							if(firstname != 'null'){
								req = req + 'firstname=\'' + firstname + '\', ';
							}
							if(lastname != 'null'){
								req = req + 'lastname=\'' + lastname + '\', ';
							}
							if(phone != 'null'){
								req = req + 'mobilephone=\'' + phone + '\' ';
							}

							req = req + 'WHERE login=\''+ username +'\'';
							
							//let requete = 'SELECT `Country_name`,`address_id` From `addresses` INNER JOIN `country` ON `addresses`.`Country_id` = `country`.`Country_id` WHERE `address_id`=' +  address_id;
								//console.log('SQL Login 2 : ' + requete);
							pool.query(req, (error,row/*,fields*/) => {
								if(error){
                                    callback(null, {headercode : 400, message: error.message, value : '', error :true});
									return ;
								}
								else{
                                    callback(null, {headercode : 200, message: 'Update Profil Success', value : '', error :false});
								}
							});
						}
					});
                }
            }
        });
    });
};