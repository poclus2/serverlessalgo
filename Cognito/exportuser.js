var mysql = require('mysql');
var fs = require('fs');

var pool  = mysql.createPool({
        host: 'ejaradb-prod.colfljowwrps.us-west-2.rds.amazonaws.com',
        user: 'admin',
        password: 'eWEVuA2k3YCa6wGHFhdj',
        database: 'ejara_db'
});

pool.getConnection(function(err, connection) {
    connection.query('SELECT * FROM customers WHERE login = \'bkrs\';', function (error, results, fields) {
        // And done with the connection.
        connection.release();
        // Handle error after the release.
        if (error){
            //callback(error);
            console.log({headercode : 400, message: error.message, value : '', error :true});
        }else{
            
            var logger = fs.createWriteStream('ejarauser.csv', {
                //flags: 'a' // 'a' means appending (old data will be preserved)
                flags: 'w' // "w" Open file for writing. The file is created (if it does not exist) or truncated (if it exists)
            })

            //On definit l'entete
            logger.write("cognito:username,name,given_name,family_name,middle_name,nickname,preferred_username,profile,picture,website,email,email_verified,gender,birthdate,zoneinfo,locale,phone_number,phone_number_verified,address,updated_at,cognito:mfa_enabled\n");
            
            //logger.write('some data') // append string to your file
            //logger.write('more data') // again
            //logger.write('and more') // again
            for (var i in results) {
                /*fs.appendFile('ejarauser.csv', results[i].login, function (err) {
                    if (err) return console.log(err);
                    console.log('Updated!');
                });*/

                var firstname = results[i].firstname;
                var lastname = results[i].lastname;
                
                if(firstname == 'NULL'){
                    firstname = '';
                }
                if(lastname == 'NULL'){
                    lastname = '';
                }


                var value = results[i].email + "," + firstname + ",," + lastname + ",,," + results[i].login + ",,,," + results[i].email + "," +  "TRUE" + ",,,,," + results[i].mobilephone + "," + "TRUE" + ",,," + "FALSE";
                console.log(value);
                if(i < results.length - 1){
                    logger.write(value + "\n");
                }else{
                    logger.write(value);
                }
            }
            logger.end();
            //process.exit(1);
        }
    });
});