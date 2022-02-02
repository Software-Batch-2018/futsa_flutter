import { Request, Response } from "express";

class UserController {
  async userHomeRoute(req: Request, res: Response) {
    try {
      return res.status(200).json({
        message: "Home Route",
      });
    } catch (error) {
      return res.status(400).json({
        message: "Error",
      });
    }
<<<<<<< HEAD:Server/src/app/controllers/UserController/index.ts

    
=======
  }
>>>>>>> cda8d13308d0cfb35d117c44f49b1212e170b32e:Server/src/app/controllers/user/index.ts
}

export default new UserController();
