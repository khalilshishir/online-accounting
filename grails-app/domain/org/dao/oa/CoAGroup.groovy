package org.dao.oa

class CoAGroup {
    String coAGroupName
    CoAClass coAClass
    boolean isActive
    Date updatedAt
    Date createdAt = new Date();

    static constraints = {
        coAGroupName (nullable :false)
        coAClass (nullable: false)
        updatedAt(nullable: true)
        createdAt(nullable: true)
    }
}
