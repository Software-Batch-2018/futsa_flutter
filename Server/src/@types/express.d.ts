declare namespace Express{
    export interface Request{
        userId: string,
        userRole: string,
        user_email: string
    }
}