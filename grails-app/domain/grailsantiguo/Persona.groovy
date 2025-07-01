package grailsantiguo

class Persona {
    String nombre
    String apellido
    String sexo
    String login
    String password

    static mapping = {
        table 'prsn'
        cache usage: 'read-write', include: 'non-lazy'
        id column: 'prsn__id'
        id generator: 'identity'
        version false
        columns {
            nombre column: 'prsnnmbr'
            apellido column: 'prsnapll'
            sexo column: 'prsnsexo'
            login column: 'prsnlogn'
            password column: 'prsnpass'
        }
    }
    static constraints = {
        nombre(size:1..63, blank:false, nullable:false, attributes:[title: 'nombre'])
        apellido(size:1..63, blank:false, nullable:false, attributes:[title: 'apellido'])
        sexo(inList: ["F", "M"], size: 1..1, blank: false, attributes: ['mensaje': 'Sexo de la personaAntiguo'])
        login(size:1..63, blank:false, nullable:false, attributes:[title: 'login'])
        password(size:1..63, blank:false, nullable:false, attributes:[title: 'password'])
    }

    String toString() {
        return this.nombre
    }
}
