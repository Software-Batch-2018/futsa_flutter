import Router from 'express'
import userRouter from './User'

const router = Router()


router.get('/', (req, res)=>{
    return res.status(200).json({
        message: "Main Route"
    })
})

router.use('/user', userRouter)

export default router