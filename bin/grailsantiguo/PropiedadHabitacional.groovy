package grailsantiguo

class PropiedadHabitacional {

    Integer numeroPisos
    Integer numeroBalcones
    Integer numeroEstacionamientos
    Integer numeroMediosBanos
    Integer numeroBanos
    Integer numeroHabitaciones

    // Correcto: Esta entidad PERTENECE a una Propiedad
    static belongsTo = [propiedad: Propiedad]

    static constraints = {
        numeroPisos nullable: true
        numeroBalcones nullable: true
        numeroEstacionamientos nullable: true
        numeroMediosBanos nullable: true
        numeroBanos nullable: true
        numeroHabitaciones nullable: true
    }
}