package grailsantiguo

class Usuario {

    String nombre
    String apellido
    String correo
    String password // Renombrado de 'contrasena' para compatibilidad con Spring Security
    String rol = 'cliente'
    Date fechaRegistro = new Date()

    static hasMany = [propiedades: Propiedad, favoritos: Favorito, compras: Compra, mensajes: Mensaje]

    static constraints = {
        correo email: true, unique: true
        password password: true, blank: false
        rol inList: ['cliente', 'admin','vendedor']
    }

    // Mapeo para que la columna en la BD se llame 'contrasena' si lo prefieres
    static mapping = {
        password column: 'contrasena'
    }
}