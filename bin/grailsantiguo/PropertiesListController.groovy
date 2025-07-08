package grailsantiguo

class PropertiesListController {

    // static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        println "Parámetros recibidos index lista: ${params}"
        def propiedades = Propiedad.createCriteria().list {

            // Búsqueda general
            if (params.q) {
                or {
                    ilike('titulo', "%${params.q}%")
                    ilike('ciudad', "%${params.q}%")
                    ilike('provincia', "%${params.q}%")
                    ilike('direccion', "%${params.q}%")
                    ilike('descripcion', "%${params.q}%")
                }
            }

            // Tipo
            if (params.tipo) {
                eq('tipo', params.tipo)
            }

            // Estado
            if (params.estado) {
                eq('estado', params.estado)
            }

            // Precio mínimo
            if (params.minPrecio?.isBigDecimal()) {
                ge('precio', params.minPrecio.toBigDecimal())
            }

            // Precio máximo
            if (params.maxPrecio?.isBigDecimal()) {
                le('precio', params.maxPrecio.toBigDecimal())
            }

            // Metros cuadrados mínimo
            if (params.minMetros?.isBigDecimal()) {
                ge('metrosCuadrados', params.minMetros.toBigDecimal())
            }

            // Metros cuadrados máximo
            if (params.maxMetros?.isBigDecimal()) {
                le('metrosCuadrados', params.maxMetros.toBigDecimal())
            }
        }

        // Enviamos la lista filtrada a la vista
        println "Propiedades encontradas: ${propiedades.size()}"
        [properties: propiedades]
        }

    def casa(Long id) {
        def propiedad = Propiedad.get(id)
        println "propiedad id: ${id}, propiedad: ${propiedad}"
        println "propiedad habitacional: ${propiedad?.propiedadHabitacional}"
        println "usuario ${propiedad.usuario}"
        if (!propiedad) {
            flash.message = "Propiedad no encontrada con id $id"
            redirect action: 'index'
            return
        }
        def propiedadHabitacional = propiedad.propiedadHabitacional
        if (!propiedadHabitacional) {
            flash.message = "La propiedad con id $id no es habitacional"
        }
        println "Detalles de la propiedad: ${propiedadHabitacional}"
        
        [propiedad: propiedad]
    }
    def buscarInicio(){
        println "buscarInicio"
        println "params: ${params}"
        redirect(controller: 'propertiesList', action: 'index', params: params)
    }

    def favoritos() {
        // Asumiendo usuario en sesión
        def usuario = session.usuario
        def favoritos = usuario ? Favorito.findAllByUsuario(usuario)*.propiedad : []
        render view: 'index', model: [properties: favoritos, haveDeleteFavs: true]
    }
}
