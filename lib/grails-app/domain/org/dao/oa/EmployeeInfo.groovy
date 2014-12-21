package org.dao.oa

class EmployeeInfo {
    String name
    String address
    Department department
    Designation designation
    boolean isActive
    static constraints = {
        name(nullable: false)
        address(nullable: false)
        designation(nullable: false)
        department(nullable: false)
    }
}
