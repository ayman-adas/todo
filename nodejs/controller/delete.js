const Modeldata = require("../model/data")

deleteFun=(req,res)=>{
    if(res){
        const {index}=req.query
    Modeldata.list.splice(index,1)
    res.send("sucsess")
    }
    else{
        res.send('error 404')
    }

}

module.exports = {
    deleteFun
}