import { User } from '../../../entity/User'
import {Request, Response} from 'express'
import { getRepository } from 'typeorm'

class FutsalOwnerRelatedController{
    async registerFutsal(req: Request, res: Response){
        const {email, password, futsal_name, futsal_address, futsal_contact} = req.body
        
        try {
            const repository = getRepository(User)
            const userExists = await repository.findOneOrFail({email: email})
            

        } catch (error) {
            res.status(400).json({
                message: "Something wrong happened"
            })
            
        }
    }
}