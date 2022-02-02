import crypto from 'crypto'
class OTPService{
    async  sendVerificationCode (email: string){
        try {
            const otp = crypto.randomInt(1000, 9999);
            const ttl = 1000 * 60 * 10
            const expires = Date.now() + ttl 
            const data = `${email}.${otp}.${expires}`
            
            /*
                Mail Otp here

            */
            const hash = crypto.createHmac('sha256', 'secret').update(data).digest('hex')
            return {
                otp: otp,
                hash: hash,
                expires: expires
            }
        } catch (error) {
            return {
                message : "error"
            }
            
        }

    }
    
}

export default new OTPService()
