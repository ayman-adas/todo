const Modeldata = require("../model/data");

const createFun = (req, res) => {
    console.log('adasd')
    if (res) {
        if (res.statusCode === 200) {
            const { task, complete } = req.body

            console.log(complete)
            Modeldata.list.push({
                id: Modeldata.counter,
                task: task,
                complete: complete,
                date: Date.now()
            }
            );
            Modeldata.counter++
            res.send("sucsess")
        } else {
            console.log(`Request failed with status code ${res.statusCode}`);
            res.send('error 404')

        }
        console.log(req.body)

    }
}

module.exports = {
    createFun
}