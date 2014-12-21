package org.dao.oa

class Department {
    String deptName
    String deptLoc

    static constraints = {
        deptName(nullable: false)
        deptLoc(nullable: true)
    }
}
