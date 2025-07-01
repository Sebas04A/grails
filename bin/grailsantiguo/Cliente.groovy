package grailsantiguo

class Cliente {
    String nombre
    String email
    String telefono

    static hasMany = [citas: Cita, propiedadesFavoritas: Propiedad]

    static constraints = {
        nombre   blank: false
        email    email: true, unique: true
        telefono matches: /\+?\d{7,15}/
    }
}