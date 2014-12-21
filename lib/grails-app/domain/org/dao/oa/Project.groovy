package org.dao.oa

class Project {
      String projectName

      boolean isActive
      Date updatedAt
      Date createdAt = new Date();
        static constraints = {
            projectName (nullable: false)
            updatedAt(nullable: true)
            createdAt(nullable: true)
        }
}
