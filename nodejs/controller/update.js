const {con} = require("../model/database");
updateFun = (req, res) => {
    console.log('ssssssssssssss');
    if (res) {
        const { id,task, complete ,date} = req.body
        const taskId = id;
          const dataToUpdate = {
            taskname: task,
            isComplete: complete,
            taskdate: date
          };
        console.log('ss222222');
        const query = 'UPDATE task SET ? WHERE taskid = ?';
        con.query(query, [dataToUpdate, taskId], (err, result) => {
            if (err) throw err;
            console.log('Table created successfully');
        });
        if (res.statusCode === 200) {
            
            res.send("sucsess")
        } 
    }
    else {
        res.send('error 404')
    }
}



module.exports = {
    updateFun
}