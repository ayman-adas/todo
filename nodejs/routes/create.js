const express= require("express")

const { createFun } = require("../controller/insert")

const craeteRouter = express.Router()
craeteRouter.post('/create',createFun)

module.exports = craeteRouter