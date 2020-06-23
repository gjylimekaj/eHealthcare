const mysql = require('mysql');

// Configure database
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password:'root',
    database: 'ehealthcare'
});

// Connect
db.connect((err)=>{
    if(err) throw err;
    console.log("Successful connection!");
});

module.exports = db;