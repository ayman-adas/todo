const express= require("express")
const { updateFun } = require("../controller/update")

const updateRouter = express.Router()
updateRouter.post('/update',updateFun)

module.exports = updateRouter