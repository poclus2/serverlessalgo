const mysql = require('mysql');
const dateTime = require("./lib/date")
const file = require("./lib/file")

// param mysql
let connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'ejara-db'
});

//Delete all fill from de database
function deleteFieldsFormDB(){
    return "DELETE FROM customers WHERE 1\n";
}

//Recuperation des pays
function GetCountry(){
    //console.log('ici');
    connection.query('SELECT * FROM `country` WHERE 1', (err,rows/*,fields*/) => {
        if(err){
            console.log(err.message);
            return ;
        }
        else{
            //console.log('Country Get\n');
            var date = dateTime.getTimeStamp();
            if (rows.length > 0){
                var req = deleteFieldsFormDB();

                req = req + "--"
                    + "-- Dumping data for table `country`"
                    + "--"
                req = req + 'INSERT INTO country (Country_id, country_name, date_begin, date_update) VALUES (' + rows[0].Country_id + ', \'' + rows[0].Country_name + '\', \''+ date + '\', \'' + date +'\')';
                for(var i=1; i< rows.length; i++){
                    req = req + '\nINSERT INTO country (Country_id, country_name, date_begin, date_update) VALUES (' + rows[i].Country_id + ', \'' + rows[i].Country_name + '\', \''+ date + '\', \'' + date +'\')';
                }
                console.log(req);
                connection.release;

                //Write content on file
                file.writeFile(req);
            }
        }
    }); 
}


//Recuperation des pays
function GetCountry(){
    //console.log('ici');
    connection.query('SELECT * FROM `country` WHERE 1', (err,rows/*,fields*/) => {
        if(err){
            console.log(err.message);
            return ;
        }
        else{
            //console.log('Country Get\n');
            var date = dateTime.getTimeStamp();
            if (rows.length > 0){
                var req = deleteFieldsFormDB();

                req = req + "--"
                    + "-- Dumping data for table `country`"
                    + "--"
                req = req + 'INSERT INTO country (Country_id, country_name, date_begin, date_update) VALUES (' + rows[0].Country_id + ', \'' + rows[0].Country_name + '\', \''+ date + '\', \'' + date +'\')';
                for(var i=1; i< rows.length; i++){
                    req = req + '\nINSERT INTO country (Country_id, country_name, date_begin, date_update) VALUES (' + rows[i].Country_id + ', \'' + rows[i].Country_name + '\', \''+ date + '\', \'' + date +'\')';
                }
                console.log(req);
                connection.release;

                //Write content on file
                file.writeFile(req);
            }
        }
    }); 
}



GetCountry();