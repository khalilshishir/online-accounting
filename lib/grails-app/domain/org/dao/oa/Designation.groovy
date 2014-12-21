package org.dao.oa

class Designation {
    String desigId
    String desigName
    static constraints = {
        desigId(nullable: false)
        desigName(nullable: false)
    }
}
