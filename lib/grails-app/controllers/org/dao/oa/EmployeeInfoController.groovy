package org.dao.oa


class EmployeeInfoController {

    def index() {
        redirect(action: 'list')
    }

    def save() {
        println(params)

        EmployeeInfo employee = null
        if(params.hidEmployeeId){
            //this code is only for edit data
            employee = EmployeeInfo.get(params.hidEmployeeId)
            def dep=Department.read(employee.department.id)
            def des=Designation.read(employee.designation.id)
            employee.name = params.name
            employee.address = params.address
            employee.department = dep
            employee.designation = des
        } else {

            employee = new EmployeeInfo()
            employee.validate(params)
            employee.properties = params
            employee.isActive = true
        }
        employee.save()
        def employeeList = EmployeeInfo.findAll()
        render(view: 'index',model: [employee:employee, employeeList: employeeList])

    }

    def list() {
        def employeeList = EmployeeInfo.findAllWhere(isActive: true)
        render(view: 'index', model: [employeeList: employeeList])
    }

    def update(Long id) {
        EmployeeInfo employee = EmployeeInfo.read(id)

        render(view: 'index', model: [name: employee.name, address: employee.address,department: employee.department, designation: employee.designation,
               hidEmployeeId : employee.id,employee:employee ])
    }

    def delete(Long id) {
        EmployeeInfo employee = EmployeeInfo.read(id)
        if(employee){
            employee.isActive=false
            employee.save();
            redirect(action: 'list')
        }
    }
}
