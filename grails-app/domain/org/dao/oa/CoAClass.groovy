package org.dao.oa

class CoAClass {
     String coAClassName
     String coAClassType

     boolean isActive
     Date updatedAt
     Date createdAt = new Date();

    static constraints = {
        coAClassName(nullable: false)
        coAClassType(nullable: false)
        updatedAt(nullable: true)
        createdAt(nullable: true)
    }
}
