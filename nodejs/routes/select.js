const express= require("express")
const { selectFun } = require("../controller/select")

const selectRouter = express.Router()

selectRouter.get('/select',selectFun)

module.exports = selectRouter