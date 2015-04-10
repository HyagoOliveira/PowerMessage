dataSource {
	pooled = true
	driverClassName = "org.postgresql.Driver"
	username = "postgres"
	configClass = HibernateFilterDomainConfiguration
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = true
	//cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
	cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory'
}
// environment specific settings
environments {
	development {

		def devUrl=System.env['POWERMESSAGE_DATABASE_URL']
		def devPass=System.env['POWERMESSAGE_DATABASE_PASSWORD']

		if (!devUrl) devUrl="jdbc:postgresql://localhost/powermessage_development"
		if (!devPass) devPass="postgres";

		dataSource {
			dbCreate = "create" // one of 'create', 'create-drop', 'update', 'validate', ''
			url = devUrl;
			password = devPass;
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:postgresql://localhost/powermessage_test"
			password = "postgres"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:postgresql://localhost/powermessage_production"
			password = "postgres"
		}
	}
}