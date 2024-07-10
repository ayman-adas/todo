const express= require("express")

const databaseRouter = express.Router()

con.query('CREATE TABLE task (taskid INT PRIMARY KEY, taskname VARCHAR(25) NOT NULL, isComplete BOOLEAN NOT NULL, taskdate DATE NOT NULL)', function (error, results, fields) {
    if (error) throw error;
    console.log('Table created successfully');
});
module.exports = databaseRouter