const {con} = require("../model/database");

selectFun = (req, res) => {
    if (res) {

        (con.query(`select * from task`, function (error, results, fields) {
            if(results){
            console.log(results)
            res.send(results)
            }else{
                console.log('error');
            }
            

        }

        ))
    }
    else {
        res.send('error 404')
    }

}

module.exports = {
    selectFun
}