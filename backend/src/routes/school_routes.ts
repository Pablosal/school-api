import { Router } from 'express'
import { schoolController } from '../controllers/school.controller'

const SchoolRouter = Router()

SchoolRouter.get('/all', schoolController.getAllSchools)
SchoolRouter.get('/:principal', schoolController.findSchoolByPrincipal)
SchoolRouter.get('/:id', schoolController.findSchoolById)
SchoolRouter.post('/', schoolController.createNewSchool)
SchoolRouter.delete('/:id', schoolController.deleteSchoolById)
SchoolRouter.put('/:id', schoolController.updateSchoolById)

export default SchoolRouter