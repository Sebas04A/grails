package grailsantiguo

class Cita {
    Date fecha
    Propiedad propiedad
    Agente agente
    Cliente cliente
    String notas

    static belongsTo = [propiedad: Propiedad, agente: Agente, cliente: Cliente]

    static constraints = {
        fecha  nullable: false
        notas  nullable: true, maxSize: 1000
    }
}