import express from 'express'
import { SchoolRouter } from '../routes'
import morgan from 'morgan'
import cors from 'cors'
import { protect } from '../modules/auth'
const app = express()

app.use(cors())
app.use(morgan())
app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use("/api/school", SchoolRouter)

export default app