import {Request, Response, NextFunction} from 'express'

import jwt from 'jsonwebtoken'

export interface TokenPayload{
    id: string,
    iat: number,
    exp: number,
    role: string,
    email: string
}


class AuthMiddleware{
    async userAuthMiddleware(req: Request, res: Response, next: NextFunction){
        const {authorization} = req.headers
        
        if(!authorization){
            return res.status(401).json({
                message: "Unauthorized Access"
            })
        }

        const token = authorization.replace('Bearer', '').trim()
        
        try {
            const data = jwt.verify(token, 'secret')
            const {id, role, email} = data as TokenPayload
            req.userId = id
            req.userRole = role
            req.user_email = email
            return next()
        } catch (error) {
            res.status(401).json({
                message: "Invalid Token"
            })
            
        }
    }
}

export default new AuthMiddleware();