const Modeldata = require("../model/data");

updateFun=(req,res)=>{
    if(res){
        const {index,task,complete,date}=req.query
        Modeldata.list.splice(index,1)

 Modeldata.list[index]=({
        id:index,
        task:task,
        complete:complete,
        date:date
     }
    ) ;
    res.send("sucsess")

    }
    else{
        res.send('error 404')
    }

}



module.exports = {
    updateFun
}