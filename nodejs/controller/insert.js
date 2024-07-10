const {con}= require("../model/database");

const createFun = (req, res) => {
    console.log('adasd')
    console.log(res.statusCode)

    if (res) {
        if (res.statusCode === 200) {
            const { id,task, complete, date } = req.body
            console.log(con.state)
  console.log(id,task,complete,date)
                const dataToInsert = { taskid: id, taskname: task, isComplete: complete, taskdate: date };
                const query = 'INSERT INTO task SET ?';
                con.query(query, dataToInsert, (err, result) => {
                    if (err) {
                        console.error('Error executing query:', err);
                    }
                    console.log('Data inserted successfully:', result);
                });    
            }
    
        
           
            console.log(req.body)
            res.send('sucssess')

        }
    }

module.exports = {
    createFun
}

