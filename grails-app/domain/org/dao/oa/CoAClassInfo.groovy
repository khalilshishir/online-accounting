package org.dao.oa

class CoAClassInfo {
     String coAClassName
     String coAClassType

     boolean isActive
     Date updatedAt = new Date();
     Date createdAt = new Date();

    static constraints = {
        coAClassName(nullable: false)
        coAClassType(nullable: false)
        updatedAt(nullable: true)
        createdAt(nullable: true)
    }
}
