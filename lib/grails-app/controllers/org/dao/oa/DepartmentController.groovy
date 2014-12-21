package org.dao.oa

class DepartmentController {
    def index() {
        redirect(action: 'list')
    }

    def save() {
        println params

        Department department=null
        if(params.hidDepartmentId){
            department = Department.get(params.hidDepartmentId)
            department.deptName=params.deptName
            department.deptLoc=params.deptLoc

        }else{
        department = new Department()
        department.validate(params)
        department.properties = params

        }
        department.save()
        def departmentList = Department.findAll()
        render(view: 'create',model: [department:department,departmentList: departmentList])
    }

    def list() {
        def departmentList = Department.findAll()
        render(view: 'create', model: [departmentList: departmentList])
    }

    def delete(Long id) {
        Department department = Department.read(id)
        department.delete();
        redirect(action: 'list')
    }
    def update(Long id) {
        Department department = Department.read(id)
        def departmentList = Department.findAll()

        render(view: 'create', model: [deptName: department.deptName, deptLoc: department.deptLoc,departmentList:departmentList,hidDepartmentId:department.id])
    }

}
