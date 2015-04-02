import com.acception.util.Util

class BootStrap {
	
	def grailsApplication
	
	def fixtureLoader

    def init = { servletContext ->	
		
		showLog();
		loadEssencialData()		
    }
	
    def destroy = {
    }
	
	def showLog(){
		def version=grailsApplication.metadata['app.version']
		def name = grailsApplication.metadata['app.name']
		println "-----------------------------------------"
		println "$name versão: $version"
		println "Grupo Acception Tecnologias (C) 2015"
		println "-----------------------------------------"
		println "System initialized..."
	}
	
	def loadEssencialData(){
		fixtureLoader.load("estados")
		fixtureLoader.load("cidades_p")
		fixtureLoader.load("security")
	}
}
