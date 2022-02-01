import {Router} from 'express'
import user from '../../app/controllers/UserController'
import auth_middleware from '../../app/middlewares/auth_middleware'

const router = Router()

router.get('/', auth_middleware.userAuthMiddleware  , user.userHomeRoute)

export default router