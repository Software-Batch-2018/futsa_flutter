import "reflect-metadata";
import {createConnection} from "typeorm";
import express from 'express'
import apiRouter from './routes'
const app = express()

const port = process.env.PORT || 4000
createConnection().then(async connection => {
    app.use(express.urlencoded({extended: false}));
    app.use('/api', apiRouter)
   app.listen(port, ()=>{
       console.log(`App is listening on port ${port}`)
   })


}).catch(error => console.log(error));
