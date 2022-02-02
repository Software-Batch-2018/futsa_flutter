import {Entity, PrimaryGeneratedColumn, Column, AfterLoad, BeforeInsert, BeforeUpdate, BaseEntity, OneToOne} from "typeorm";
import bcrypt from 'bcryptjs'
import { Futsal } from "./Futsal";

export enum UserRole{
    ADMIN = "admin",
    FUTSAL_OWNER = "futsal_owner",
    USER = "user"
}

@Entity()
export class User extends BaseEntity {

    private tempPassword!: string;

    @PrimaryGeneratedColumn()
    id: number;

    @Column({nullable: true})
    fullName: string;


    @Column()
    email: string

    @Column("bool", {default: false})
    is_verified : boolean

    @Column()
    password: string

    @Column("enum", {enum: UserRole, default: UserRole.USER})
    role: UserRole

    @OneToOne(()=>Futsal, futsal=>futsal.user)
    futsal : Futsal


    @AfterLoad()
    private loadPassword(){
        this.tempPassword = this.password
    }

    
    @BeforeInsert()
    @BeforeUpdate()
    async hashPassword(){
        if(this.password !== this.tempPassword){
            try {
                const salt = await bcrypt.genSalt(8)
                this.password = await bcrypt.hash(this.password, salt)
            } catch (error) {
                throw error;
            }
        }
    }

}
