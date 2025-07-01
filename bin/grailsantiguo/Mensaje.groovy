package grailsantiguo


class Mensaje {

    String mensaje
    Date fechaEnvio = new Date()

    // Correcto: El mensaje pertenece a un usuario y se asocia a una propiedad
    static belongsTo = [usuario: Usuario, propiedad: Propiedad]

    static constraints = {
        mensaje blank: false
    }
}