const fs = require('fs');

var file_path = "./migration.sql";

function writeFile(content){
    //console.log(tickets);
    fs.writeFile(file_path, content, (err) => {
        // throws an error, you could also catch it here
        if (err) throw err;
    });
}

function emptyFile(){
    //console.log(tickets);
    fs.writeFile(file_path, '', (err) => {
        // throws an error, you could also catch it here
        if (err) throw err;
        // success case, the file was saved
    });
}

function addContentToFile(content){
    
    var file_content= fs.readFileSync(config.ticket_file_path);

    file_content = file_content + '\n' + content;
    
    fs.writeFile(file_path, file_content, (err) => {
        // throws an error, you could also catch it here
        if (err) throw err;
        // success case, the file was saved
    });
}

exports.writeFile = writeFile;
exports.emptyFile = emptyFile;
exports.addContentToFile = addContentToFile;