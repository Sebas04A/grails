package grailsantiguo

class Direccion {
    String calle
    String ciudad
    String provincia
    String codigoPostal

    static embedded = true

    static constraints = {
        calle        blank: false
        ciudad       blank: false
        provincia    blank: false
        codigoPostal matches: /\d{5}/
    }
}