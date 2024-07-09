const express= require("express")
const { updateFun } = require("../controller/update")

const updateRouter = express.Router()
updateRouter.patch('/update',updateFun)

module.exports = updateRouter