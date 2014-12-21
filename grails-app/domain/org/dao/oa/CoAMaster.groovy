package org.dao.oa

class CoAMaster {
    String accountCode
    String accountName
    CoAClass coaClass
    CoAGroup coaGroup
    Double balance
    String accountStatus
    boolean isDebitable
    boolean isCreditable
    Project project
    boolean isActive
    Date updatedAt
    Date createdAt = new Date();

    static constraints = {

        accountCode(nullable: false)
        accountName(nullable: false)
        coaClass(nullable: false)
        coaGroup(nullable: false)
        balance(nullable: true)
        isCreditable(nullable: true)
        isDebitable(nullable: true)
        project(nullable: false)
        updatedAt(nullable: true)
        createdAt(nullable: true)
    }
}
