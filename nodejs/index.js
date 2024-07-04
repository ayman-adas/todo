const express=require('express');
const craeteRouter = require('./routes/create');
const updateRouter = require('./routes/update');
const selectRouter = require('./routes/select');
const deleteRouter = require('./routes/delete');
const  app=express()
app.use(express.json());

app.use( craeteRouter);
app.use( selectRouter);
app.use( deleteRouter);
app.use( updateRouter);

app.listen(1010,()=> console.log("listen")
)