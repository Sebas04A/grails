package grailsantiguo

class ImagenPropiedad {

    String urlImagen
    String descripcion

    static belongsTo = [propiedad: Propiedad]

    static constraints = {
        urlImagen blank: false
        descripcion nullable: true
    }
    static mapping = {
        urlImagen type: "text"
    }
}