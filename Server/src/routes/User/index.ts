import UserAuthController from '../../app/controllers/UserController/UserAuthController'
import {Router} from 'express'

const router = Router()

//Basic Authintication related Routes
router.post('/login', UserAuthController.authenticate)
router.post('/register', UserAuthController.registerUser)
router.post('/reset', UserAuthController.resetPassword)
router.post('/verify-password', UserAuthController.verifyTokenAndResetPassword )
router.post('/account-verify', UserAuthController.verifyOTPandAccount)


export default router