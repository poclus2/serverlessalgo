//Permet de retirer du temps de l'object Date
function dateRemove (currentDate, value, timeUnit) {

    timeUnit = timeUnit.toLowerCase();
    var multiplyBy = { w:604800000,
                     d:86400000,
                     h:3600000,
                     m:60000,
                     s:1000 };
    var updatedDate = new Date(currentDate.getTime() - multiplyBy[timeUnit] * value);

    return updatedDate;
};
//var date = new Date("December 31, 2017 11:30:25");
//console.log(dateRemove( date, 40, "s"));


//Permet de d'ajouter du temps de l'object Date
function dateAdd (currentDate, value, timeUnit) {

    timeUnit = timeUnit.toLowerCase();
    var multiplyBy = { w:604800000,
                     d:86400000,
                     h:3600000,
                     m:60000,
                     s:1000 };
    var updatedDate = new Date(currentDate.getTime() - multiplyBy[timeUnit] * value);

    return updatedDate;
};

//recuperer la date actuelle
exports.getDateTime = function getDateTime() {

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

//Retire quelques seconde et formate la date
exports.getDateTimeEarly = function getDateTimeEarly() {

    //On retire 30 seconde
    var date =  dateRemove( new Date(), 30, "s");
    

    var hour = date.getHours();
    hour = (hour < 10 ? "0" : "") + hour;

    var min  = date.getMinutes();
    min = (min < 10 ? "0" : "") + min;

    var sec  = date.getSeconds();
    sec = (sec < 10 ? "0" : "") + sec ;

    var year = date.getFullYear();

    var month = date.getMonth() + 1;
    month = (month < 10 ? "0" : "") + month;

    var day  = date.getDate();
    day = (day < 10 ? "0" : "") + day;

    return year + ":" + month + ":" + day + ":" + hour + ":" + min + ":" + sec;
}




