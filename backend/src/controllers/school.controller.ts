
import { Request, Response } from "express";
import { prisma } from "../db";

class SchoolController {
    constructor() {

    }
    async getAllSchools(req: Request, res: Response) {

        const schools = await prisma.school.findMany()
        if (!schools.lenght) {
            res.status(200).json({ msg: "No existen escuelas en la base de dates" })
            return
        }
        res.json({ msg: schools })
    }
    findSchoolByPrincipal(req: Request, res: Response) {

        console.log("🚀 ~ file: school.controller.ts:14 ~ SchoolController ~ findSchoolByPrincipal ~ ")
    }
    findSchoolById(req: Request, res: Response) {

    }
    async deleteSchoolById(req: Request, res: Response) {
        const id = parseInt(req.params.id)
        const deleteSchool = await prisma.school.delete({
            where: {
                id
            },
        })
        res.status(200).json({ msg: deleteSchool })
    }
    updateSchoolById(req: Request, res: Response) {

    }
    async createNewSchool(req: Request, res: Response) {
        console.log(req.body)
        await prisma.school.create({
            data: {
                school_name: req.body.school_name,
                is_premium: req.body.is_premium,
                school_principal: req.body.school_principal
            }
        })
        res.status(300).json({ msg: "user created" })
    }
}

export const schoolController = new SchoolController()
