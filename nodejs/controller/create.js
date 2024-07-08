const Modeldata = require("../model/data");

const createFun = (req,res)=>{
    console.log('adasd')
    if(res){
        const {task,complete}=req.query
        console.log(complete)
    Modeldata.list.push({
        id:Modeldata.counter,
        task:task,
        complete:complete,
        date:Date.now()
     }
    ) ;
   Modeldata.counter++
   res.send("sucsess")
    }else{
        res.send('error 404')
    }
}

module.exports = {
    createFun
}