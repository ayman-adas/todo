const express=require('express');
const route = express.Router()
// const databaseRouter=require('./database')
const craeteRouter = require('./create');
const updateRouter = require('./update');
const selectRouter = require('./select');
const deleteRouter = require('./delete');
route.use( craeteRouter);
route.use( selectRouter);
route.use( deleteRouter);
route.use( updateRouter);
// route.use(databaseRouter)
module.exports = route
