package grailsantiguo
import org.hibernate.criterion.CriteriaSpecification

class PropertiesListController {

    // static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        println "Parámetros recibidos index lista: ${params}"
        

def propiedades = Propiedad.createCriteria().list {
    // Hacemos LEFT-JOIN y alias para las imágenes...
    createAlias('imagenes', 'img', CriteriaSpecification.LEFT_JOIN)
    // ...y pedimos sólo entidades raíz únicas
    resultTransformer(CriteriaSpecification.DISTINCT_ROOT_ENTITY)

    // Búsqueda general
    if (params.q) {
        or {
            ilike('titulo',      "%${params.q}%")
            ilike('ciudad',      "%${params.q}%")
            ilike('provincia',   "%${params.q}%")
            ilike('direccion',   "%${params.q}%")
            ilike('descripcion', "%${params.q}%")
        }
    }

    // Tipo
    if (params.tipo) {
        eq('tipo', params.tipo)
    }

    // Estado
    if (params.estado) {
        def estadosValidos = ['En venta', 'alquiler', 'vendida']
        def estadoParam    = params.estado?.trim()?.toLowerCase()

        def estadoValido = estadosValidos.find { it.toLowerCase() == estadoParam }
        println "Estado recibido: ${params.estado}, estado válido: ${estadoValido}"

        if (estadoValido) {
            eq('estado', estadoValido)  // Usa el valor "original" con mayúsculas
        } else {
            log.warn "Estado no válido: ${params.estado}"
        }
    }

    // Precio mínimo/máximo
    if (params.minPrecio?.isBigDecimal()) {
        ge('precio', params.minPrecio.toBigDecimal())
    }
    if (params.maxPrecio?.isBigDecimal()) {
        le('precio', params.maxPrecio.toBigDecimal())
    }

    // Metros cuadrados mínimo/máximo
    if (params.minMetros?.isBigDecimal()) {
        ge('metrosCuadrados', params.minMetros.toBigDecimal())
    }
    if (params.maxMetros?.isBigDecimal()) {
        le('metrosCuadrados', params.maxMetros.toBigDecimal())
    }
}

        println "Propiedades encontradas: ${propiedades.size()}"
        // Obtener favoritos del usuario actual si está logueado
        def favoritos = []
        def usuarioId = session.usuario?.id
        
        if (usuarioId && propiedades) {
            def propiedadIds = propiedades.collect { it.id }
            favoritos = Favorito.createCriteria().list {
                eq('usuario.id', usuarioId)
                'in'('propiedad.id', propiedadIds)
            }.collect { it.propiedad.id }
        }

        // Enviamos la lista filtrada a la vista
        println "Propiedades encontradas: ${propiedades.size()}"
        [properties: propiedades, favoritos: favoritos]
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
