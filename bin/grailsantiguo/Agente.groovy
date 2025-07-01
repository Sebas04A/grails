package grailsantiguo

class Agente {
    String nombre
    String email
    String telefono
    String numeroLicencia

    static hasMany = [propiedades: Propiedad, citas: Cita]

    static constraints = {
        nombre          blank: false
        email           email: true, unique: true
        telefono        matches: /\+?\d{7,15}/
        numeroLicencia  blank: false, unique: true
    }
}