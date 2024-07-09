const Modeldata = require("../model/data");

updateFun = (req, res) => {
    console.log('ssssssssssssss');
    if (res) {
        console.log('ss222222');
        if (res.statusCode === 200) {
            console.log('AAAAAAAAAAAA');
            const { index, task, complete, date } = req.body
            
            console.log(Modeldata.list);

            Modeldata.list[id] = ({
                id: index,
                task: task,
                complete: complete,
                date: date
            }
            );
            res.send("sucsess")
        } else {
            res.send('error 404')
        }
    }
    else {
        res.send('error 404')
    }
}



module.exports = {
    updateFun
}