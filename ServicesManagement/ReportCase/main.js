var mysql = require('mysql');
var nodemailer = require("nodemailer");
var config = require('./config.json');
var getDateTime = require('./date');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

//For mail
var transport = nodemailer.createTransport({
    host: "email-smtp.us-west-2.amazonaws.com",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
        user: "AKIA24MVVAYM2C2OJ7RS",
        pass: "BHeW3MK0JkJlhrZkHHybg9kOPbpE8wIPzYR55Si1BlxE"
    }
});

exports.handler = (event, context, callback) => {

    var username = event['username'];
    var email = event['email'];
    var reportcase = event['reportcase'];
    var description = event['description'];
    var mobilephone = event['mobilephone'];
    var name = event['name'];

    
    if ((email == "" || email == null) || (reportcase == "" || reportcase == null)
        || (description == "" || description == null) || (mobilephone == "" || mobilephone == null)
        || (name == "" || name == null)) {
        callback(null, { headercode: 400, message: 'Missing arguments', value: '', error: true });
    }else{
        if(reportcase== "Other"){
            reportcase = "Some Problem";
        }
        if(username == "" || username == null){
            username = "";
        }
        var mailOptions2 = {
            from: "mickael@nzinghaa.io", // sender address
            //to: "nelly@nzinghaa.io,abdel@nzinghaa.io,baptiste@nzinghaa.io,fradith@nzinghaa.io,jamal@nzinghaa.io,nchatue@gmail.com", // list of receivers
            to: "mickael@nzinghaa.io",
            subject: "Client case: " + reportcase, // Subject line
            // text: "Bonjour  Nytral  "+name+ ", ", // plaintext body
            html: "<b>Hello !! </b> <br> Un client a des soucis " // html body
                + " <br><b> Merci bien vouloir traiter</b><br><br>" 
                + " <br></b> Détails du report </b><br>" 
                + " <br> Nom du client: " + name 
                + " <br> Username: " + username 
                + " <br> Email: " + email
                + " <br> Telephone: " + mobilephone
                + " <br> Description: " + description
        }

        transport.sendMail(mailOptions2, function (error, response) {
            if (error) {
                callback(null, { headercode: 400, message: error.message, value: '', error: true })
            } else {
                //console.log("Message sent: " + response.message);
                callback(null, { headercode: 200, message: 'Generate report case success', value: '', error: false })
            }
        });
    }
    
}
var mysql = require('mysql');
var nodemailer = require("nodemailer");
var config = require('./config.json');
var getDateTime = require('./date');

var pool = mysql.createPool({
    host: config.dbhost,
    user: config.dbuser,
    password: config.dbpassword,
    database: config.dbname
});

//For mail
var transport = nodemailer.createTransport({
    host: "email-smtp.us-west-2.amazonaws.com",
    port: 587,
    secure: false, // true for 465, false for other ports
    auth: {
        user: "AKIA24MVVAYM2C2OJ7RS",
        pass: "BHeW3MK0JkJlhrZkHHybg9kOPbpE8wIPzYR55Si1BlxE"
    }
});

exports.handler = (event, context, callback) => {

    var username = event['username'];
    var email = event['email'];
    var reportcase = event['reportcase'];
    var description = event['description'];
    var mobilephone = event['mobilephone'];
    var name = event['name'];

    
    if ((email == "" || email == null) || (reportcase == "" || reportcase == null)
        || (description == "" || description == null) || (mobilephone == "" || mobilephone == null)
        || (name == "" || name == null)) {
        callback(null, { headercode: 400, message: 'Missing arguments', value: '', error: true });
    }else{
        if(reportcase== "Other"){
            reportcase = "Some Problem";
        }
        if(username == "" || username == null){
            username = "";
        }
        var mailOptions2 = {
            from: "mickael@nzinghaa.io", // sender address
            //to: "nelly@nzinghaa.io,abdel@nzinghaa.io,baptiste@nzinghaa.io,fradith@nzinghaa.io,jamal@nzinghaa.io,nchatue@gmail.com", // list of receivers
            to: "mickael@nzinghaa.io",
            subject: "Client case: " + reportcase, // Subject line
            // text: "Bonjour  Nytral  "+name+ ", ", // plaintext body
            html: "<b>Hello !! </b> <br> Un client a des soucis " // html body
                + " <br><b> Merci bien vouloir traiter</b><br><br>" 
                + " <br></b> Détails du report </b><br>" 
                + " <br> Nom du client: " + name 
                + " <br> Username: " + username 
                + " <br> Email: " + email
                + " <br> Telephone: " + mobilephone
                + " <br> Description: " + description
        }

        transport.sendMail(mailOptions2, function (error, response) {
            if (error) {
                callback(null, { headercode: 400, message: error.message, value: '', error: true })
            } else {
                //console.log("Message sent: " + response.message);
                callback(null, { headercode: 200, message: 'Generate report case success', value: '', error: false })
            }
        });
    }
    
}
