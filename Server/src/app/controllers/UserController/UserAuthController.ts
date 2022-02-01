import { User } from '../../../entity/User'
import {Request, Response} from 'express'
import { getRepository } from 'typeorm'
import bcrypt from 'bcryptjs'
import jwt from 'jsonwebtoken'
import jwtSecret from '../../../config/config'
class UserAuthController{
    async authenticate(req: Request, res: Response){
        try {
            const repository = getRepository(User)
            const {email, password} = req.body

            const user = await repository.findOne({
                where: {
                    email
                }
            })
            if(!user){
                return res.status(401).json({
                    message: "Email does not exist"
                })
            }

            if(user.is_verified == false){
                /*
                    OTP SYSTEM GOES HERE
                */

                return res.status(200).json({
                    message: "Account not verified"
                })
            }

            const isValidPassword = await bcrypt.compare(password, user.password)
            if(!isValidPassword){
                return res.status(401).json({
                    message: "Incorrect Password"
                })
            }

            const token = jwt.sign({id: user.id, role: user.role, email: user.email,}, 'JSONtokenSecretVeryLongPayloadhahaha', {
                expiresIn: '5d'
            })

            return res.status(200).json({
                message: "Authentication Success",
                user,
                accessToken: token
            })

            
        } catch (error) {
            return res.status(400).json({
                message: "Server Error"
            })
            
        }

    }

    async registerUser(req: Request, res: Response){
        const {email, password, full_name} = req.body

        try {
            const repository = getRepository(User)
            const userExists = await repository.findOne({where:{email}})
            if(userExists){
                return res.status(409).json({
                    message: "User Already Exists"
                })
            }

            const user = repository.create({
                fullName: full_name,
                email: email, 
                password: password
            })
            await repository.save(user)

            /*

                OTP LOGIC HERE

            */

                return res.status(200).json({
                    message: "Successfully added User"
                })

        } catch (error) {

            return res.status(400).json({
                message: "Error Resistering user data"
            })
            
        }
    }


    async resetPassword(req: Request, res: Response){
        const {email} = req.body
        
        try {
            const user = await getRepository(User).findOneOrFail({email: email})
            
            const secret = jwtSecret + user.password

            const payload = {
                email: user.email,
                id: user.id
            }

            const token = jwt.sign(payload, secret, {
                expiresIn: "20m"
            })

            const link = `RESET PASSWORD URL GENERATIONN ${token}`
            /*
                sending password reset mail here
            */

                return res.status(200).json({
                    message: "Success",
                    link: link
                })

        } catch (error) {
            return res.status(400).json({
                message: "Error Processing data..."
            })
            
        }
    }

    async verifyTokenAndResetPassword(req: Request, res: Response){
        const {id, token, password} = req.body

        try {
            const user = await getRepository(User).findOneOrFail({id: id})

            const secret = jwtSecret + user.password

            jwt.verify(token, secret)

            user.password = password
            await user.save()

            return res.status(200).json({
                message: "Successfully update password"
            })
        } catch (error) {
            return res.status(400).json({
                message: "Error something went wrong!"
            })
            
        }
    }
}