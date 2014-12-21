package org.dao.oa

class CoAMasterInfo {
    String accountCode
    String accountName
    CoAClassInfo coaClass
    CoAGroupInfo coaGroup
    Double balance
    String accountStatus
    String isDebitable
    String isCreditable
    Project project
    boolean isActive
    Date updatedAt = new Date();
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
