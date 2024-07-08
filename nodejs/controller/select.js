const Modeldata = require("../model/data");

selectFun=(req,res)=>{
    if(res){
         tasksObject = [];

        Modeldata.list.forEach((task, index) => {
            tasksObject[index] = {
                id:task.id,
                task: task.task,
                complete: task.complete,
                date:task.date // Assuming you want the current timestamp for each task
            };
        });
    
res.send(tasksObject)
 }
 else{
    res.send('error 404')
}

    }
    
module.exports = {
    selectFun
}