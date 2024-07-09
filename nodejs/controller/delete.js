const Modeldata = require("../model/data")

deleteFun=(req,res)=>{
    if(res){
         if (res.statusCode === 200) {
        const {index}=req.body
    Modeldata.list.splice(index,1)
    res.send("sucsess")
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