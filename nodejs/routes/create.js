const express= require("express")
const { createFun } = require("../controller/create")

const craeteRouter = express.Router()
craeteRouter.post('/create',createFun)

module.exports = craeteRouter