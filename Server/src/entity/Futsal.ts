import { BaseEntity, Column, Entity, OneToOne, PrimaryGeneratedColumn } from "typeorm";
import { User } from "./User";


@Entity()
export class Futsal extends BaseEntity{
    @PrimaryGeneratedColumn()
    futsal_id : number

    @OneToOne(()=> User, user=>user.futsal, {cascade:true})
    user: User

    @Column()
    futsal_name : string

    @Column("bool", {default: true})
    is_active : boolean

    @Column({nullable: true})
    futsal_image: string


    @Column()
    futsal_address: string

    @Column()
    futsal_contact: string


}