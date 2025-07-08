package grailsantiguo

class InicioController {

    def index() {"hola" }
    def buscarCasas(){
        return [nombre: "Omotito Rest"]
    }
    def buscar() {
        println "Parámetros recibidos en buscar: ${params}"
        redirect(controller: 'propertiesList', action: 'index', params: params)
    }
}
