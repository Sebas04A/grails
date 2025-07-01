package grailsantiguo

class Compra {

    BigDecimal montoPagado
    Date fechaCompra = new Date()

    // Correcto: La compra pertenece a un usuario y a una propiedad
    static belongsTo = [usuario: Usuario, propiedad: Propiedad]

    static constraints = {
        montoPagado min: 0.01G
    }
}