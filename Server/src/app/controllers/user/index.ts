import {Request, Response} from 'express'


class UserController{
    async userHomeRoute(req: Request, res: Response){
        try {
            return res.status(200).json({
                message: "Home Route"
            })
            
        } catch (error) {
            return res.status(400).json({
                message: "Error"
            })
        }
    }
}

export default new UserController();