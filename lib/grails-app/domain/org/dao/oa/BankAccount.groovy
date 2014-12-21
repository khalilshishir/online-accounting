package org.dao.oa

class BankAccount {
    Project project
    CoAMaster coaMaster
    String bankAccountName
    String bankName
    String accountNumber
    String accountType
    String address
    boolean isActive

    Date updatedAt = new Date();
    Date createdAt = new Date();

    static constraints = {
        project(nullable: false)
        coaMaster(nullable: false)
        bankName(nullable: false)
        accountNumber(nullable: false)
        accountType(nullable: false)
        bankAccountName(nullable: false)
        address(nullable: true)


        updatedAt(nullable: true)
        createdAt(nullable: true)
    }
}
