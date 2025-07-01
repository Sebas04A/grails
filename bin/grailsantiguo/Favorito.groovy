package grailsantiguo

class Favorito {

    Date fechaAgregado = new Date()

    // Correcto: Un favorito es la unión que pertenece a un Usuario y a una Propiedad
    static belongsTo = [usuario: Usuario, propiedad: Propiedad]

    static constraints = {
        // Esta restricción ahora funcionará correctamente sobre las claves foráneas
        usuario unique: 'propiedad'
    }
}