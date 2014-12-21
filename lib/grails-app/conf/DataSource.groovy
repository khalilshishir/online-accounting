dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "com.mysql.jdbc.Driver"

}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = 'create-drop'//"create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost:3306/grails_accounting"
            username = "root"
            password = ""        }
    }
    test {
        dataSource {
            dbCreate = "create"
            url = "jdbc:mysql://localhost:3306/grails_accounting"
            username = "root"
            password = ""
        }
    }
    production {
        dataSource {
            properties {
            }
        }
    }
}
