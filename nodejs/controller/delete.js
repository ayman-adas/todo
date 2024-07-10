const {con} = require("../model/database");

deleteFun=(req,res)=>{
    if(res){
         if (res.statusCode === 200) {
        const {taskid}=req.body
        const query = 'DELETE FROM task WHERE taskid = ?';
        con.query(query, taskid, (err, result) => {     
                   if (err) throw err;
            console.log('Table created successfully');
        });    res.send("sucsess")
    } else{
        res.send('error 404')
    }
}
else{
    res.send('error 404')
}

}

module.exports = {
    deleteFun
}