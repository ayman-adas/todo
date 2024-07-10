var mysql= require('mysql');
var con = mysql.createConnection({
    host : "localhost",
     user: "root",
     password : "",
     database:"todo"
  });
  con.connect((err) => {
    if (err) {
        console.error('Error connecting to database:', err.stack);
        return;
    }
    console.log('Connected to database with id', con.threadId);
});
module.exports={con}