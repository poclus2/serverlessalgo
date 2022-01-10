var mysql = require('mysql');
var config = require('./config.json');
const AmazonCognitoIdentity = require('amazon-cognito-identity-js');
const CognitoUserPool = AmazonCognitoIdentity.CognitoUserPool;
const AWS = require('aws-sdk');
const request = require('request');
const jwkToPem = require('jwk-to-pem');
const jwt = require('jsonwebtoken');
global.fetch = require('node-fetch');

var pool  = mysql.createPool({
    host     : config.dbhost,
    user     : config.dbuser,
    password : config.dbpassword,
    database : config.dbname
});

const poolData = {    
    UserPoolId : "us-west-2_ayTX3kXmJ", // Your user pool id here    
    ClientId : "r3vvu485ve6rb3m6q2feie7p0", // Your client id here
    ClientSecret : "fumu81sj8ba8emt8mdkld8p75mka71l6nf4hdopn39nplbq6msr"
}; 
const pool_region = 'us-west-2';
const userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);

function Login() {
    var authenticationDetails = new AmazonCognitoIdentity.AuthenticationDetails({
        Username : 'sampleEmail@gmail.com',
        Password : 'SamplePassword123',
    });

    var userData = {
        Username : 'sampleEmail@gmail.com',
        Pool : userPool
    };

    var cognitoUser = new AmazonCognitoIdentity.CognitoUser(userData);

    cognitoUser.authenticateUser(authenticationDetails, {
        onSuccess: function (result) {
            console.log('access token + ' + result.getAccessToken().getJwtToken());
            console.log('id token + ' + result.getIdToken().getJwtToken());
            console.log('refresh token + ' + result.getRefreshToken().getToken());
        },
        onFailure: function(err) {
            console.log(err);
        },

    });
}
Login();

/*pool.getConnection(function(err, connection) {
    // Use the connection
    connection.query('SELECT login from customers where login=\'Mick\'', function (error, results, fields) {
        // And done with the connection.
        connection.release();
        // Handle error after the release.
        if (error) throw error;
        else console.log(results[0].login);
        process.exit();
    });
});*/