package grailsantiguo

class Foto {
    String url
    Boolean principal = false
    Propiedad propiedad

    static belongsTo = [propiedad: Propiedad]

    static constraints = {
        url       url: true, blank: false
        principal nullable: false
    }
}