package grailsantiguo

class InicioController {

    def index() {"hola" }
    def buscarCasas(){
        return [nombre: "Omotito Rest"]
    }
}
