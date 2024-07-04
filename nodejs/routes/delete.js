const express= require("express")
const { deleteFun } = require("../controller/delete")

const deleteRouter = express.Router()
deleteRouter.post('/delete',deleteFun)

module.exports = deleteRouter