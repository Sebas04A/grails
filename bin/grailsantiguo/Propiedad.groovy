package grailsantiguo
class Propiedad {

    String titulo
    String descripcion
    String tipo
    BigDecimal precio
    String direccion
    String ciudad
    String provincia
    String pais
    BigDecimal metrosCuadrados
    String estado = 'disponible'
    Date fechaCreacion = new Date()

    // Campo de la relación uno a uno
    PropiedadHabitacional propiedadHabitacional

    // Correcto: Una propiedad pertenece a un usuario (quien la administra)
    static belongsTo = [usuario: Usuario]

    // Correcto: Una propiedad TIENE UNA compra (cuando se vende)
    static hasOne = [compra: Compra]

    // Correcto: tiene muchas imágenes, favoritos y mensajes
    static hasMany = [imagenes: ImagenPropiedad, favoritos: Favorito, mensajes: Mensaje]

    static constraints = {
        tipo inList: ['casa', 'departamento', 'terreno', 'local']
        estado inList: ['En venta','alquiler', 'vendida']
        propiedadHabitacional nullable: true, unique: true // unique para forzar el 1-a-1
        compra nullable: true
    }
}