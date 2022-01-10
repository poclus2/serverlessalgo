//const bcoin = require('bcoin').set('main');
const bcoin = require('bcoin').set('main');
const WalletDB = bcoin.WalletDB;
const WalletKey = bcoin.wallet.WalletKey;
const KeyRing = bcoin.keyring;
const Mnemonic = bcoin.hd.Mnemonic;
const HD = bcoin.hd;
const { WalletClient } = require('bclient');
const { Network } = require('bcoin');
const util = require('util');
//const network = Network.get('main');
const network = Network.get('main');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const port = 4000;
const fs = require('fs')
var express = require('express');
var app = express();
var conseiljs = require('conseiljs')
var ne = require('node-each');
const conseilServer = { url: 'https://conseil-prod.cryptonomic-infra.tech', apiKey: 'galleon' };
const tezosNode = 'https://tezos-prod.cryptonomic-infra.tech';
const conseilNode =
{
    url: 'https://tezos-prod.cryptonomic-infra.tech',
    apiKey: 'BUIDLonTezos-021'
};


const platform = 'tezos';
const xtznetwork = 'mainnet';
const entity = 'operations';


// param mysql
/*let connection = mysql.createConnection({
                  host: 'ejaradb.colfljowwrps.us-west-2.rds.amazonaws.com',
                  user: 'admin',
                  password: 'Gh2jxkxOdWss',
                  database: 'ejara-db'
            });*/

// param mysql
let connection = mysql.createConnection({
    host: 'ejaradb-prod.colfljowwrps.us-west-2.rds.amazonaws.com',
    user: 'admin',
    password: 'eWEVuA2k3YCa6wGHFhdj',
    database: 'ejara_db'
});

//For post request                
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


// acount cat 
app.get('/CreateWallet', function (req, res) {
    CreateWallet().catch(console.error.bind(console));

    async function CreateWallet() {
        const wdb = new WalletDB({ db: 'memory' });
        await wdb.open();

        const wallet = await wdb.create();
        console.log(" Your wallet has been created!");

        res.json({ wallet })
    }
})

// acount cat 
app.post('/CreateBTCWallet', function (req, res) {
    //console.log("body:" + JSON.stringify(req.body));
    //console.log("headers:" + JSON.stringify(req.headers));
    var post = req.body;

    let witness, watchOnly, accountKey;

    var passphrase = post.passphrase;
    var id = post.id;

    var username = id;

    witness = false
    watchOnly = false

    //Create account btc
    CreateAccount().catch(console.error.bind(console));
    async function CreateAccount() {
        const wdb = new WalletDB({ db: 'memory' });
        await wdb.open();

        const wallet = await wdb.create();
        //console.log(wallet);

        const account = await wallet.getAccount('default');
        const addr = account.receiveAddress();

        const jdAccount = await wallet.createAccount({ name: username });
        console.log("Create Account result :"/* + JSON.stringify(jdAccount)*/);

        console.log("Account BTC Has been created: ")
        //res.json(jdAccount)

        //Create New Wallet
        const walletOptions =
        {
            network: network.type,
            port: network.walletPort,
            apiKey: 'api-key'
        }

        const options =
        {
            //passphrase: passphrase,
            witness: witness,
            watchOnly: watchOnly,
            accountKey: accountKey
        };

        const walletClientBTC = new WalletClient(walletOptions);

        WalletCreate().catch(console.error.bind(console));
        async function WalletCreate() {
            console.log("id : " + id);
            console.log("options: " + JSON.stringify(options));
            const result = await walletClientBTC.createWallet(id, options);
            console.log("WalletCreate BTC succes :" /*+ JSON.stringify(result)*/);
            //res.json(result)


            //GetMnemonic fonction
            const walletBTC = walletClientBTC.wallet(id);

            GetMnemonic().catch(console.error.bind(console));
            async function GetMnemonic() {
                const resultMnemonic = await walletBTC.getMaster();
                console.log("Menomnic BTC succes create : " + resultMnemonic);
                //res.json(result)let id, passphrase;

                const options =
                {
                    passphrase: passphrase,
                    witness: witness,
                    watchOnly: watchOnly,
                    accountKey: accountKey
                };

                const walletClientBTC = new WalletClient(walletOptions);
                const wallet = walletClientBTC.wallet(id);

                SetPassphrase().catch(console.error.bind(console));
                async function SetPassphrase() {
                    const result = await wallet.setPassphrase(passphrase);
                    console.log(result);
                    res.json({ headercode: 200, message: 'Wallet BTC create success', value: { Id: id, mnemonic: resultMnemonic.mnemonic.phrase }, error: false });
                }
            }
        }
    }
})

// acount cat 
app.get('/WalletInfos', function (req, res) {
    var id = req.param('Walletid');
    const walletOptions =
    {
        network: network.type,
        port: network.walletPort,
        apiKey: 'api-key'
    }

    const walletClient = new WalletClient(walletOptions);
    const wallet = walletClient.wallet(id);

    WalletInfos().catch(console.error.bind(console));
    async function WalletInfos() {
        const result = await wallet.getInfo();
        //console.log(result);
        //res.json(result)

    }



})
// acount cat 
app.get('/Walletlist', function (req, res) {

    const walletOptions =
    {
        network: network.type,
        port: network.walletPort,
        apiKey: 'api-key'
    }

    const walletClient = new WalletClient(walletOptions);
    Walletlist().catch(console.error.bind(console));
    async function Walletlist() {

        const result = await walletClient.getWallets();
        console.log(result);
        res.json(result)
    }

})

// btc cat
app.get('/BTCGetBalance', function (req, res) {
    let id, account;
    id = req.param('id')
    account = 'default'


    const { WalletClient } = require('bclient');
    const { Network } = require('bcoin');

    const walletOptions =
    {
        network: network.type,
        port: network.walletPort,
        apiKey: 'api-key'
    }

    const walletClient = new WalletClient(walletOptions);
    const wallet = walletClient.wallet(id);

    GetBalance().catch(console.error.bind(console));
    async function GetBalance() {
        const result = await wallet.getBalance(account);
        console.log(result);
        res.json(result)
    }
}
)
// btc cat
var unirest = require('unirest');
//route pour aficher les balances

app.get('/btcfees', function (req, res) {



    unirest.get('http://127.0.0.1:8332/fee?block=3')
        .header('Accept', 'application/json')
        .end(function (response) {

            console.log('reponse de la unirest')
            console.log(response);
            res.json(response)

            // let updatebil = 'UPDATE bilresponse SET message=\''+eta+'\' WHERE transactionId=\''+ bn +'\''



            /////

        });

}
)

//tezos cat
app.get('/tezosfees', function (req, res) {
    console.log(' route tezos fees')

    fetchAverageFees().catch(console.error.bind(console));

    async function fetchAverageFees() {


        const fees = await conseiljs.TezosConseilClient.getFeeStatistics(conseilServer, xtznetwork, 'transaction');

        //  result = {low: fees[0]['low'], medium: fees[0]['medium'], high: fees[0]['high']};
        res.json(fees)
    }



}
)




//bcoin cat
app.get('/GetReceiveAddress', function (req, res) {
    let id, account;
    id = req.param('id')
    account = 'default'


    const { WalletClient } = require('bclient');
    const { Network } = require('bcoin');

    const walletOptions =
    {
        network: network.type,
        port: network.walletPort,
        apiKey: 'api-key'
    }

    const walletClient = new WalletClient(walletOptions);
    const wallet = walletClient.wallet(id);

    GetReceiveAddress().catch(console.error.bind(console));
    async function GetReceiveAddress() {
        const result = await wallet.createAddress(account);
        console.log(result);
        res.json(result)
    }
}
)
//bcoin cat
app.post('/SendBtc', function (req, res) {
    var post = req.body;
	
    let id, passphrase, rate, address;
    id = post.id;
    passphrase = post.passphrase;
    rate = post.rate;
    valu = post.value
    value = parseInt(valu);
    address = post.address;
	
	console.log('rate : ' + rate);


    const { NodeClient } = require('bclient');
    const { Network } = require('bcoin');

    const { WalletClient } = require('bclient');
    //const {Network} = require('bcoin');

    const walletOptions = {
        network: network.type,
        port: network.walletPort,
        apiKey: 'api-key'
    }

    const clientOptions = {
        network: network.type,
        port: network.rpcPort,
        apiKey: 'api-key'
    }


    const client = new NodeClient(clientOptions);


    const walletClient = new WalletClient(walletOptions);
    const wallet = walletClient.wallet(id);

    const options = {
        passphrase: passphrase,
        rate: rate,
        outputs: [{ value: value, address: address }]
    };

    SendBtc().catch(function(err){
		console.log("send btc error :" + err.message);
		if(err.message.includes('Output is dust')){
			res.json({ headercode: 400, message: 'The amount is insufficient to make transaction', value: '', error: true });
		}else if(err.message.includes('Not enough funds')){
			res.json({ headercode: 400, message: 'Insufficient balance', value: '', error: true });
		}else if(err.message.includes('Non-base58 character') || err.message.includes('Network mismatch for base58 address.')
			 || err.message.includes('Address version padding is non-zero')){
			res.json({ headercode: 400, message: 'Incorrect receiver address', value: '', error: true });
		}else{
			res.json({ headercode: 400, message: 'Send BTC error', value: '', error: true });
		}
	});
    async function SendBtc() {
        const result = await wallet.send(options);
        console.log(result);
        //res.json(result)
		if((result.outputs[0].address == address) || (result.outputs[1].address == address)){
			res.json({ headercode: 200, message: 'Send BTC success', value: { hash : result.hash}, error: false });
		}
		else{
			res.json({ headercode: 200, message: 'Send BTC success', value: result, error: false });
		}
    }

}
)
//bcoin cat
app.get('/MiningBtc', function (req, res) {
    let numblocks, address;
    numblocks = 100;
    address = req.param('address');
    const { NodeClient } = require('bclient');
    const { Network } = require('bcoin');

    const clientOptions = {
        network: network.type,
        port: network.rpcPort,
        apiKey: 'api-key'
    }

    const client = new NodeClient(clientOptions);

    MiningBtc().catch(console.error.bind(console));
    async function MiningBtc() {
        const result = await client.execute('generatetoaddress', [numblocks, address]);
        console.log(result);
        res.json(result)
    }
}
)
//bcoin cat
app.get('/GetWalletInfos', function (req, res) {
    let id;
    id = req.param('id')

    const { WalletClient } = require('bclient');
    const { Network } = require('bcoin');

    const walletOptions = {
        network: network.type,
        port: network.walletPort,
        apiKey: 'api-key'
    }

    const walletClient = new WalletClient(walletOptions);
    const wallet = walletClient.wallet(id);

    SendBtc().catch(console.error.bind(console));
    async function SendBtc() {
        const result = await wallet.getInfo();
        console.log(result);
        res.json(result)
    }
}
)
//bcoin cat
app.get('/BTCGetTransactionsList', function (req, res) {
    let count, from, watchOnly;

    let id;
    id = req.param('username');

    const { WalletClient } = require('bclient');
    const { Network } = require('bcoin');

    const walletOptions =
    {
        network: network.type,
        port: network.walletPort,
        apiKey: 'api-key'
    }



    const walletClient = new WalletClient(walletOptions);
    const wallet = walletClient.wallet(id);
    const account = 'default';

    GetTransactionsList().catch(console.error.bind(console));
    async function GetTransactionsList() {
        const resulti = await walletClient.execute('selectwallet', [id]);

        const result = await walletClient.execute('listtransactions', ['', 100000]);
        //console.log("resulti : " + resulti);
        console.log("Result get transaction : ");
        //console.log(result)
		

        for(var i =0;i<result.length;i++){
                //result[i]['link']="https://www.blockchain.com/en/btc/tx/"+result[i]['txid']
                //https://blockstream.info/tx/6fe2a8d31c18b2cc72787ad4e3704e59aaa0f7344b5397d9178c11c91dd3e850
                result[i]['link']="https://blockstream.info/tx/"+result[i]['txid']
                
        }
        //res.json(result);
        //res.json(result);

        let sql = 'SELECT `login` FROM `customers` WHERE `login`=\'' + id + '\';';
		//console.log("sql : " + sql);

        connection.query(sql, (err, rows) => {
            if (err) {
                console.log(err.message);
                res.send(err.message);
                return;
            }else if (rows.length == 0) {
                res.json('Incorrect username');
                //console.log ('Le sender est: '+ rows[0]['login'])
            }else {
                let receiveAddress = rows[0].public_key_hash;

                var kj = 0;
                var count;
                jresults = [];
                var keyCount = Object.keys(result).length;


                if (keyCount == 0) {
                    res.json(result);
                    return;
                }

                var options = {
                    debug: true,
                    on: 'time',
                    when: 4000.000001 // equals to 150000001 nanoseconds
                };

                do {
                    kj += 1;

                    ne.each(result.reverse(), function (element, i = 0) {
                        return new Promise(function (resolve) {

                            setTimeout(function () {
                                var date = element.time;
                                var jAmount = element.amount;
                                var linkhash = element.link;
                                //var Fee = element.fee;
                                //console.log('amount ====='+ jAmount)      

                                // Verification pour un send 


                                //Verification pour un receive
                                if (receiveAddress == element.address) {
                                    //console.log("We are there 2");
                                    var Sender = element.address;

                                    let sql = 'SELECT `login`, `public_key_hash` FROM customers '
                                        + 'JOIN wallet '
                                        + 'ON wallet.`customer_id` = customers.customers_id WHERE (`public_key_hash` = \'' + Sender + '\')';

                                    connection.query(sql, (err, rows) => {
                                        if (err) {
                                            console.log(err.message);
                                            res.send(err.message);
                                            return;
                                        }
                                        var SenderUsername;
                                        if (rows.length == 0) {
                                            SenderUsername = 'External Address';
                                            //console.log ('Le sender est: '+ rows[0]['login'])
                                        }
                                        else {
                                            SenderUsername = rows[0]['login'];
                                        }

                                        count = {
                                            "type": 'Receive',
                                            "username": SenderUsername,
                                            "address": Sender,
                                            //Fees:  Fee,
                                            "date": date,
                                            "amount": jAmount,
                                            "link": linkhash
                                        }

                                        jresults.push(count);
                                    });
                                }
                                else {
                                    //console.log("We are there");
                                    var Receiver = element.address;

                                    let sql = 'SELECT `login`, `public_key_hash` FROM customers '
                                        + 'JOIN wallet '
                                        + 'ON wallet.`customer_id` = customers.customers_id WHERE (`public_key_hash` = \'' + Receiver + '\')';

                                    //console.log("req sql receiver : " + sql);
                                    connection.query(sql, (err, rows) => {
                                        if (err) {
                                            console.log(err.message);
                                            response.send('Null');
                                            return;
                                        }

                                        var ReceiverUsername;
                                        if (rows.length == 0) {
                                            ReceiverUsername = 'External Address';
                                        }
                                        else {
                                            ReceiverUsername = rows[0]['login'];
                                        }
                                        //var ReceiverUsername = rows[0].login;
                                        JSON.stringify(rows);

                                        count = {
                                            "type": "Send",
                                            "username": ReceiverUsername,
                                            "address": Receiver,
                                            //Fees:  Fee,
                                            "date": date,
                                            "amount": jAmount,
                                            "link": linkhash
                                        }

                                        //console.log(count);
                                        //console.log('ajout du push count')
                                        jresults.push(count);
                                        //console.log(jresults[i])
                                    })

                                    //console.log('affichage du ret');
                                }
                                //console.log('row has index of ' + i);
                                //console.log('Loops executing', ne.stats.executing);

                                resolve();

                            }, 30);
                        });
                        //connection.release();
                    }, options).then(data => {
                        //console.log('fonction then dans le callback');
                        //console.log(jresults);

                        //console.log('envoie des donnees en json ')
                        //console.log('envoie des donnees en json ')
                        //console.log(jresults);
                        console.log("Get Transaction for user [" + id + "] : Ok" )
                        res.send(jresults);
                        //console.log(data);

                    })

                } while (kj < 1);

                //fin du for each

                console.log('Transaction number :' + keyCount);

                // console.log(jresults);  
                // JSON.stringify(jresults);

                //console.log('the Jresult are:' + jresults);
            }
        });

        //const result = await wallet.getHistory(account);
        //console.log(result);

        /* var keyCount = Object.keys(result).length;
      var ret = new Array;
        var reti = new Array;
            for (var i = 0; i < keyCount; i++)
            {
                var Type = Object.values(result)[i].inputs[0].value;
                var Confirmation = Object.values(result)[i].confirmations;
                var count = i;
                //console.log(Type);
                if (Type == "0")
                {
                    var Date = Object.values(result)[i].mdate;
                    var Amount = Object.values(result)[i].outputs[0].value;
                    var Address = Object.values(result)[i].inputs[0].address;
                    Type = 'receive';
                }
                else if (Type != "0")
                {
                    Type = 'send';
                    var Date = Object.values(result)[i].mdate;
                    var Amount = Object.values(result)[i].outputs[1].value;
                    var Address = Object.values(result)[i].outputs[0].address;
                }

                var ret =
                [
                   count =
                    {
                    address: Address,
                    type: Type,
                    confirmation: Confirmation,
                    Date: Date,
                    Amount: Amount,
                    },
                ];
  */              //reti.push(ret);
    }
    //var jsonret = JSON.stringify(reti);



    //const test = Object.values(result)[0].height;
    //console.log(result);
    //res.json(result)
}
)




app.get('/M4g8tKlKHY7854Hgdbrdf45FyJR', (reqs, response) => {

    let obj = {
        service: reqs.params('service'),
        transaction_id: reqs.params('transaction_id'),
        transaction_uuid: reqs.params('transaction_uuid'),
        phone: reqs.params('phone'),
        amount: reqs.params('amount'),
        fee: reqs.params('fee'),
        status: reqs.params('status'),
        message: reqs.params('message'),
        country_name: reqs.params('country_name'),
        country_code: reqs.params('country_code'),
        operator: reqs.params('operator'),
        currency: reqs.params('currency'),
        sign: reqs.params('sign')
    }

    const servicek = 'bFhwL6Hfv48gyi9ZdxlcrtJ177vgXQFw';
    //ip des serveur de monetbil
    let serveurip = ['184.154.224.14', '184.154.224.222'];
    let ipcserver = reqs.connection.remoteAddress;

    //verification de la provenance de la requete
    if ((ipcserver === serveurip[0]) || (ipcserver === serveurip[1])) {

        console.log('le serveur est bon c est monetbil ');

        //comparaison des deux clÃƒÆ’Ã‚Â©s internes et celle recu dans la requete
        if (servicek === ipcserver) {

            console.log('le controlle sur la respondance de cle est bon ');
            // verificaion de la signature
            if (obj.sign) {
                console.log('la requete est signÃƒÆ’Ã‚Â© ');


            }

        } else {

            console.log('attention la cle du service n est pas bonne ');

        }


    } else {


        console.log('le serveur qui repond n est pas monetbil');

    }
})




















// tezos cat
app.get('/CreateXTZWallet', function (req, res) {
    createWallet().catch(console.error.bind(console));
    async function createWallet() {
        const mnemonic = conseiljs.TezosWalletUtil.generateMnemonic();
        //console.log(`mnemonic: ${mnemonic}`);
        const keystore = await conseiljs.TezosWalletUtil.unlockIdentityWithMnemonic(mnemonic, 'Vykuj3546');
        var ret =
        {
            'seed': mnemonic,
            'publickey': keystore.publicKey,
            'privatekey': keystore.privateKey,
            'publickeyhash': keystore.publicKeyHash,
        };
        //ret = JSON.stringify(ret);
        res.json({ headercode: 200, message: 'Wallet XTZ create success', value: ret, error: false });
    }
});

app.get('/xtzgetBalance', function (req, res) {

    //var pbk = req.param('publickey');
    //var prk = req.param('privatekey');
    var pkh = req.param('publickeyhash');

    const keystore = {
        publicKey: '',
        privateKey: '',
        publicKeyHash: pkh,
        seed: '',
        storeType: 'conseiljs.StoreType.Fundraiser'
    };
    accountBalance().catch(console.error.bind(console));
    async function accountBalance() {
        console.log(keystore.publicKey);
        let accountQuery = conseiljs.ConseilQueryBuilder.blankQuery();
        accountQuery = conseiljs.ConseilQueryBuilder.addFields(accountQuery, 'account_id', 'balance');
        accountQuery = conseiljs.ConseilQueryBuilder.addPredicate(accountQuery, 'account_id', conseiljs.ConseilOperator.EQ, [keystore.publicKeyHash]);
        accountQuery = conseiljs.ConseilQueryBuilder.setLimit(accountQuery, 1);
        const result = await conseiljs.ConseilDataClient.executeEntityQuery(conseilServer, 'tezos', 'mainnet', 'accounts', accountQuery);
        console.log(result);
        res.json(result);
        //console.log(`${util.inspect(result, false, 2, false)}`);
    }

})



app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.post('/xtzsendtx', function (req, res) {
    var post = req.body;
    //var pbk = req.param('publickey');
    //var prk = req.param('privatekey');
    //var pkh = req.param('publickeyhash');
    //var amount = req.param('amount');
    //var receiver = req.param('receiver');

    var pbk = post.publickey;
    var prk = post.privatekey;
    var pkh = post.publickeyhash;
    var amount = post.amount;
    var receiver = post.receiver;
    var rate = post.rate;


    //console.log('publickey : ' + pbk);
    //console.log('privatekey : ' + prk);
    //console.log('publickeyhash : ' + pkh);
    //console.log('amount : ' + amount);
    //console.log('receiver : ' + receiver);
	console.log('rate : ' + rate);
    const keystore = {
        publicKey: pbk,
        privateKey: prk,
        publicKeyHash: pkh,
        seed: '',
        storeType: 'conseiljs.StoreType.Fundraiser',
    };

    if (keystore.privateKey == null) {
        res.json({ error: 'private null' });
    } else {

        //console.log(keystore)

        sendxtz().catch(function(err){
			//console.error.bind(err);
			console.log('send xtz error : ' + err.message);
			res.json({headercode : 400, message: err, value : '', error :true})
		});
    }


    async function sendxtz() {
        const result = await conseiljs.TezosNodeWriter.sendTransactionOperation(tezosNode, keystore, receiver, amount, rate, '');
		//console.log(`Injected operation group id ${result.operationGroupID}`);
			
		var ret = `Injected operation group id ${result.operationGroupID}`;
		console.log('send result : ' + ret);
		
		if(ret.includes('Empty implicit contract')){
			res.json({headercode : 400, message: 'Account uninitialized', value : '', error :true});
		}else if(ret.includes('Balance of contract') && ret.includes('too low') ){
			res.json({headercode : 400, message: 'Insufficient balance', value : '', error :true});
		}else if(ret.includes('Injected operation group id \"')){
			res.json({headercode : 200, message: 'Send XTZ success', value : '', error :false});
		}else{
			res.json({headercode : 400, message: result, value : '', error :true});
		}
    }
})

app.post('/xtzsendtxuser', function (req, res) {
    var post = req.body;


    var pbk = req.param('publickey');
    var prk = req.param('privatekey');
    var pkh = req.param('publickeyhash');
    var amount = req.param('amount');
    var receiveraddress = req.param('receiver');
    var address = "2";
    var rate = req.param('rate');
	console.log('rate : ' + rate);

    const keystore = {
        publicKey: pbk,
        privateKey: prk,
        publicKeyHash: pkh,
        seed: '',
        storeType: 'conseiljs.StoreType.Fundraiser',
    };

    if (keystore.privateKey == null) {
        res.json({ error: 'private null' });
    } else {
        //console.log(keystore);
		//onsole.log('req :' + 'SELECT `wallet`.`public_key_hash` FROM `wallet` INNER JOIN customers ON wallet.customer_id = customers.customers_id  WHERE customers.login =\'' + receiveraddress + '\' AND wallettype_id = 3') 
        connection.query('SELECT `wallet`.`public_key_hash` FROM `wallet` INNER JOIN customers ON wallet.customer_id = customers.customers_id  WHERE customers.login =\'' + receiveraddress + '\' AND wallettype_id = 3', (err, rows/*,fields*/) => {
            if (err) {
                console.log(err.message);
                return;
            }
            else if (rows.length == 0) {
                console.log("log : " + "Incorrect username");
                res.json("Incorrect username");
            }
            else {
                address = rows[0].public_key_hash;
                console.log("log : " + "adresse : " + address);

                sendxtz().catch(function(err){
					//console.error.bind(err);
					console.log('send xtz error : ' + err.message);
					res.json({headercode : 400, message: err, value : '', error :true})
				});
				
                async function sendxtz() {
                    const result = await conseiljs.TezosNodeWriter.sendTransactionOperation(tezosNode, keystore, address, amount, rate, '');
						
					var ret = `Injected operation group id ${result.operationGroupID}`;
					console.log('send result : ' + ret);
					
					if(ret.includes('Empty implicit contract')){
						res.json({headercode : 400, message: 'Account uninitialized', value : '', error :true});
					}else if(ret.includes('Balance of contract') && ret.includes('too low') ){
						res.json({headercode : 400, message: 'Insufficient balance', value : '', error :true});
					}else if(ret.includes('Injected operation group id \"')){
						res.json({headercode : 200, message: 'Send XTZ success', value : '', error :false});
                        console.log('result sucees: ' + {headercode : 200, message: 'Send XTZ success', value : '', error :false});
					}else{
						res.json({headercode : 400, message: result, value : '', error :true});
					}
                }
            }
        })
    }
})

app.post('/pxtzsendtx', function (req, res) {
    var post = req.body;
    var pbk = 'edpktix1cCm1HAAgnTyxSpxzhuHhq4MiDuDbJET9w1Dmk7KWcrVJuv'
    var prk = 'edskRpfAD8cV4bUWwoVseFWBK9FEo9qF7inH4nERo5RWUNEZZbTqYdBRN6wjNFHhgXnr7we5Hkpfcd61X42mR8LXVNhaXTtAgX';
    var pkh = 'tz1LPvCPF8GMYBttJt2rt7MeU5A1D8mEdNyg';
    //var amount = req.param('amount');
    // var receiver = req.param('receiver');

    //var pbk = post.publickey;
    //var prk = post.privatekey;
    //var pkh = post.publickeyhash;
    var amount = post.amount * 1000000;
    amount = amount.toFixed(0);
    var receiver = post.receiver;
    var id_t = post.id_transaction;
    var livreur = post.livreur
    var today = getDateTime()
    //var fees = post.fees ;

    console.log(' Receiver :' + receiver);

    console.log('votre amount est  : ' + amount)
    //console.log('publickey : ' + pbk);
    //console.log('privatekey : ' + prk);
    //console.log('publickeyhash : ' + pkh);
    //console.log('amount : ' + amount);
    //console.log('receiver : ' + receiver);
    const keystore = {
        publicKey: pbk,
        privateKey: prk,
        publicKeyHash: pkh,
        seed: '',
        storeType: 'conseiljs.StoreType.Fundraiser',
    };

    //console.log('sql : ' + 'SELECT statut FROM buy WHERE transaction_id = ' + id_t);
    connection.query('SELECT statut FROM buy WHERE transaction_id = ' + id_t, function (error, results) {
        if (error) throw error;
        console.log('resssssssssssulta');
        console.log(results[0].statut)

        if (results[0].statut == "0") {
            if (keystore.privateKey == null) {
                res.json({ 'message': 'private null', 'error': true });
            } else {
                //console.log(keystore)

                sendxtz().catch(console.error.bind(console));
                async function sendxtz() {
                    const result = await conseiljs.TezosNodeWriter.sendTransactionOperation(tezosNode, keystore, receiver, amount, 20000, '');
                    //  console.log("Injected operation group id"+ ${result.operationGroupID});
                    connection.query("UPDATE buy SET statut = ?,date_traitement= ?,transactionhash= ?,livreur= ? WHERE transaction_id = ?", ["1", today, result.operationGroupID, livreur, id_t], function (error, results) {
                        if (error) throw error;
                        //   return res.send({ error: false, data: results, message: 'user has been updated successfully.' });              
                    });
                    res.json({ 'Injected operation group id': result.operationGroupID, 'message': 'success', 'code': '200', 'error': false });
                }
            }
        } else {
            res.json({ 'message': 'Transaction déjà traiter', 'error': true });
        }
        //   return res.send({ error: false, data: results, message: 'user has been updated successfully.' });

    });
})


app.post('/pxtzcancel', function (req, res) {
    var post = req.body;

    var amount = post.amount;
    // var receiver = post.receiver;
    var id_t = post.id_transaction;
    var user = post.login;
    var today = getDateTime();
    var solde = 0;
    //var fees = post.fees ;

    connection.query("SELECT balance_cfa FROM customers WHERE login= ?", [user], function (error, results) {
        if (error) throw error;
        solde = results[0].balance_cfa + amount;
        console.log(results)

    });


    //console.log('sql : ' + 'SELECT statut FROM buy WHERE transaction_id = ' + id_t);
    connection.query('SELECT statut FROM buy WHERE transaction_id = ' + id_t, function (error, results) {
        if (error) throw error;
        console.log('resssssssssssulta');
        console.log(results[0].statut)

        if (results[0].statut == 0) {



            connection.query("UPDATE buy SET statut = ?,date_traitement= ? WHERE transaction_id = ?", [2, today, id_t], function (error, results1) {
                if (error) throw error;
                console.log(results1)

                connection.query("UPDATE customers SET balance_cfa = ? WHERE login= ?", [solde, user], function (error, results2) {
                    if (error) throw error;
                    console.log(results2)

                    res.json({ 'message': 'traitement efectué avec succes', 'code': '200', 'error': false });
                });
            });



        } else {
            res.json({ 'message': 'Transaction déjà traitée', 'error': true });
        }
        //   return res.send({ error: false, data: results, message: 'user has been updated successfully.' });

    });
})



app.post('/pSendBtc', function (req, res) {

    //   var post=req.body;
    // console.log(post);
    console.log('route livraison des btc');
    // let id, passphrase, rate, address;
    var rate = 10000;
    var id = "masterejara";
    var passphrase = "QaE5N3vus426WEjara";

    var seed = req.param('seed');


    var valu = req.param('valu');
    var id_t = req.param('itransaction');
    var livreur = req.param('livreur');

    valu = valu * 100000000
    var address = req.param('address');
    var today = getDateTime()
    console.log('The id is :' + id_t)
    console.log('The value is :' + valu)
    const { NodeClient } = require('bclient');
    const { Network } = require('bcoin');

    const { WalletClient } = require('bclient');
    //const {Network} = require('bcoin');

    const walletOptions = {
        network: network.type,
        port: network.walletPort,
        apiKey: 'api-key'
    }

    const clientOptions = {
        network: network.type,
        port: network.rpcPort,
        apiKey: 'api-key'
    }


    const client = new NodeClient(clientOptions);


    const walletClient = new WalletClient(walletOptions);
    const wallet = walletClient.wallet(id);

    const options = {
        passphrase: passphrase,
        rate: rate,
        outputs: [{ value: valu, address: address }]
    };

    console.log(options);









    connection.query('SELECT statut FROM buy WHERE transaction_id = ' + id_t, function (error, results) {
        if (error) throw error;
        console.log('resssssssssssulta');
        console.log(results[0].statut)

        if (results[0].statut == "0") {



            SendBtc().catch(console.error.bind(console));
            async function SendBtc() {
                const result = await wallet.send(options);
                console.log(result);
                //  console.log("Injected operation group id"+ ${result.operationGroupID});
                connection.query("UPDATE buy SET statut = ?,date_traitement= ?,transactionhash= ?,livreur= ? WHERE transaction_id = ?", ["1", today, result.hash, livreur, id_t], function (error, results) {
                    if (error) throw error;
                    //   return res.send({ error: false, data: results, message: 'user has been updated successfully.' });              
                });
                res.json({ 'Injected operation group id': result.hash, 'message': 'success', 'code': '200', 'error': false });
            }

        } else {
            res.json({ 'message': 'Transaction déjà traiter', 'error': true });
        }
        //   return res.send({ error: false, data: results, message: 'user has been updated successfully.' });

    });










})



app.post('/xtzgetkeys', function (req, res) {
    var seed = req.param('seed');
    var user = req.param('user');


    xtzgetkeys().catch(function(err){
		//console.error.bind(err);
		console.log('seed  generation error : ' + err.message);
		if(err.message.includes('Invalid mnemonic length')){
			//console.log("test");
			res.json({headercode : 400, message: 'Invalid mnemonic length', value : '', error :true})
		}else if(err.message.includes('The given mnemonic could not be validated')){
			res.json({headercode : 400, message: 'Incorrect mnemonic', value : '', error :true})
		}else{
			res.json({headercode : 400, message: error.message, value : '', error :true})
		}
	})
    async function xtzgetkeys() {
        const keystore = await conseiljs.TezosWalletUtil.unlockIdentityWithMnemonic(seed, 'Vykuj3546')
        var ret =
        {
            'seed': seed,
            'publickey': keystore.publicKey,
            'privatekey': keystore.privateKey,
            'publickeyhash': keystore.publicKeyHash,
        }
        console.log("Seed generated for user : " + user);
        //console.log("Seed generated for user : " + JSON.stringify(ret));
        //ret = JSON.stringify(ret);
        //res.json(ret);
		res.json({headercode : 400, message: 'Recovery wallet success', value : ret, error :true})
    }
})

app.get('/xtzgettxlist', function (req, res) {
    var user = req.param('user');
    var receiveadd = req.param('address');
    ret = new Array;
    reti = new Array;
    var kj = 0;

    results = new Array;
    var count;
    jresults = [];

    const keystore = {
        publicKey: '',
        privateKey: '',
        publicKeyHash: receiveadd,
        seed: '',
        storeType: 'conseiljs.StoreType.Fundraiser',
        email: 'yoyhmapi.ugewcsiv@tezos.example.org',
        amount: '5652123072'
    };

    var pool = mysql.createPool({
        connectionLimit: 1000,
        host: 'localhost',
        user: 'admin',
        password: 'Vykuj3546',
        database: 'nzinghaadata1'
    });

    xtzgettxlist().catch(console.error.bind(console));
    async function xtzgettxlist() {
        //jresults.splice(0,jresults.length);

        let sendQuery = conseiljs.ConseilQueryBuilder.blankQuery();
        sendQuery = conseiljs.ConseilQueryBuilder.addFields(sendQuery, 'block_level', 'timestamp', 'source', 'destination', 'amount', 'fee', 'counter', 'operation_group_hash');
        sendQuery = conseiljs.ConseilQueryBuilder.addPredicate(sendQuery, 'kind', conseiljs.ConseilOperator.EQ, ['transaction'], false);
        sendQuery = conseiljs.ConseilQueryBuilder.addPredicate(sendQuery, 'source', conseiljs.ConseilOperator.EQ, [keystore.publicKeyHash], false);
        sendQuery = conseiljs.ConseilQueryBuilder.addPredicate(sendQuery, 'status', conseiljs.ConseilOperator.EQ, ['applied'], false);
        sendQuery = conseiljs.ConseilQueryBuilder.addOrdering(sendQuery, 'block_level', conseiljs.ConseilSortDirection.DESC);
        sendQuery = conseiljs.ConseilQueryBuilder.addOrdering(sendQuery, 'block_level', conseiljs.ConseilSortDirection.ASC);
        sendQuery = conseiljs.ConseilQueryBuilder.setLimit(sendQuery, 100);

        let receiveQuery = conseiljs.ConseilQueryBuilder.blankQuery();
        receiveQuery = conseiljs.ConseilQueryBuilder.addFields(receiveQuery, 'block_level', 'timestamp', 'source', 'destination', 'amount', 'fee', 'counter', 'operation_group_hash');
        receiveQuery = conseiljs.ConseilQueryBuilder.addPredicate(receiveQuery, 'kind', conseiljs.ConseilOperator.EQ, ['transaction'], false);
        receiveQuery = conseiljs.ConseilQueryBuilder.addPredicate(receiveQuery, 'destination', conseiljs.ConseilOperator.EQ, [keystore.publicKeyHash], false);
        receiveQuery = conseiljs.ConseilQueryBuilder.addPredicate(receiveQuery, 'status', conseiljs.ConseilOperator.EQ, ['applied'], false);
        receiveQuery = conseiljs.ConseilQueryBuilder.addOrdering(receiveQuery, 'block_level', conseiljs.ConseilSortDirection.DESC);
        receiveQuery = conseiljs.ConseilQueryBuilder.setLimit(receiveQuery, 100);

        const sendResult = await conseiljs.ConseilDataClient.executeEntityQuery(conseilServer, platform, xtznetwork, entity, sendQuery);
        const receiveResult = await conseiljs.ConseilDataClient.executeEntityQuery(conseilServer, platform, xtznetwork, entity, receiveQuery);
        const transactions = sendResult.concat(receiveResult).sort((a, b) => { return a['timestamp'] - b['timestamp'] });

        //res.json(transactions);
        //console.log(`${util.inspect(transactions, false, 2, false)}`);

        var keyCount = Object.keys(transactions).length;
        var options = {
            debug: true,
            on: 'time',
            when: 4000.000001 // equals to 150000001 nanoseconds
        };

        do {
            kj += 1;
            if (keyCount == 0) {
                res.json(jresults);
                return;
            }

            ne.each(transactions.reverse(), function (element, i = 0) {
                return new Promise(function (resolve) {

                    setTimeout(function () {
                        var date = element.timestamp;
                        var jAmount = element.amount;
                        var Fee = element.fee;
                        var hash =element.operation_group_hash;
                        console.log('amount =====' + jAmount)
						//console.log(element)

                        // Verification pour un send 


                        //Verification pour un receive
                        if (receiveadd == element.destination) {
                            //console.log("We are there 2");
                            var Sender = element.source;

                            let sql = 'SELECT `login`, `public_key_hash` FROM customers '
                                + 'JOIN wallet '
                                + 'ON wallet.`customer_id` = customers.customers_id WHERE (`public_key_hash` = \'' + Sender + '\')';

                            connection.query(sql, (err, rows) => {
                                if (err) {
                                    console.log(err.message);
                                    response.send('Null');
                                    return;
                                }
                                if (rows.length == 0) {
                                    var SenderUsername = 'External Address';
                                    //console.log ('Le sender est: '+ rows[0]['login'])
                                }
                                else {
                                    var SenderUsername = rows[0]['login'];
                                }

                                count = {
                                    type: 'Receive',
                                    username: SenderUsername,
                                    address: Sender,
                                    fees: Fee,
                                    date: date,
                                    amount: jAmount,
                                    link:"https://tezos.id/operations/"+hash
                                }

                                jresults.push(count);
                            });
                        }
                        else if (receiveadd == element.source) {
                            console.log("We are there");
                            var Receiver = element.destination;

                            let sql = 'SELECT `login`, `public_key_hash` FROM customers '
                                + 'JOIN wallet '
                                + 'ON wallet.`customer_id` = customers.customers_id WHERE (`public_key_hash` = \'' + Receiver + '\')';
                            connection.query(sql, (err, rows) => {
                                if (err) {
                                    console.log(err.message);
                                    response.send('Null');
                                    return;
                                }
                                if (rows.length == 0) {
                                    var ReceiverUsername = 'External Address';
                                }
                                else {
                                    var ReceiverUsername = rows[0]['login'];
                                }
                                //var ReceiverUsername = rows[0].login;
                                JSON.stringify(rows);

                                count = {
                                    type: "Send",
                                    username: ReceiverUsername,
                                    address: Receiver,
                                    fees: Fee,
                                    date: date,
                                    amount: jAmount,
									link:"https://tezos.id/operations/"+hash
                                }

                                console.log(count);
                                console.log('ajout du push count')
                                jresults.push(count);
                                //console.log(jresults[i])
                            })

                            //console.log('affichage du ret');
                        }
                        console.log('row has index of ' + i);
                        console.log('Loops executing', ne.stats.executing);

                        resolve();

                    }, 30);
                });
                //connection.release();
            }, options).then(data => {
                console.log('fonction then dans le callback');
                console.log(jresults);

                //console.log('envoie des donnees en json ')
                console.log('envoie des donnees en json ')
                console.log(jresults);

                res.json(jresults);
                console.log(data);

            })

        } while (kj < 1);

        //fin du for each

        console.log('Transaction number :' + keyCount);

        // console.log(jresults);  
        // JSON.stringify(jresults);

        console.log('the Jresult are:' + jresults);

    }
})

//-------------------Server Listening --------------------------------
//app.listen(3000)
app.listen(port, (err) => {
    if (err) {
        return console.log('An Error Occured.', err)
    }

    console.log(`server is listening on ${port}`)
})




