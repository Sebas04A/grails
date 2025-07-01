package grailsantiguo

class Propietario {
    String nombre
    String email
    String telefono

    static hasMany = [propiedades: Propiedad]

    static constraints = {
        nombre   blank: false
        email    email: true, unique: true
        telefono matches: /\+?\d{7,15}/
    }
}