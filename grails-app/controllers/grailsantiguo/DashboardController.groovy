package grailsantiguo

import grails.converters.JSON

class DashboardController {

    // 1. Gráfico de Barras: Número de Propiedades por Tipo
    def propiedadesPorTipo() {
        def data = Propiedad.createCriteria().list {
            projections {
                groupProperty('tipo')
                count('id')
            }
        }.collect { [x: it[0].capitalize(), y: it[1]] }

        render([series: [[name: 'Cantidad', data: data]]] as JSON)
    }

    // 2. Histograma: Distribución de Precios de las Propiedades
    def distribucionPrecios() {
        def precios = Propiedad.findAllByPrecioIsNotNull().collect { it.precio }
        def rangos = [
            '0-50k': 0, '50k-100k': 0, '100k-200k': 0,
            '200k-500k': 0, '500k+': 0
        ]

        precios.each { precio ->
            if (precio < 50000) rangos['0-50k']++
            else if (precio < 100000) rangos['50k-100k']++
            else if (precio < 200000) rangos['100k-200k']++
            else if (precio < 500000) rangos['200k-500k']++
            else rangos['500k+']++
        }

        def data = rangos.collect{ k, v -> [x: k, y: v] }
        render([series: [[name: 'Propiedades', data: data]]] as JSON)
    }

    // 3. Gráfico de Barras Horizontales: Top 10 Ciudades
    def topCiudades() {
        def data = Propiedad.createCriteria().list {
            projections {
                groupProperty('ciudad')
                count('id', 'total')
            }
            order('total', 'desc')
            maxResults(10)
        }.collect { [x: it[0] ?: "No especificada", y: it[1]] }
        
        render([series: [[name: 'Propiedades', data: data.reverse()]]] as JSON) // Se invierte para que el mayor quede arriba
    }

    // 4. Gráfico de Barras: Las 10 Propiedades con más Favoritos
    def topFavoritos() {
        def data = Favorito.createCriteria().list {
            projections {
                groupProperty('propiedad')
                count('id', 'total')
            }
            order('total', 'desc')
            maxResults(10)
        }.collect { [x: it[0].titulo, y: it[1]] }
        
        render([series: [[name: 'Nº Favoritos', data: data]]] as JSON)
    }

    // 5. Diagrama de Dispersión: Relación Precio vs. Metros Cuadrados
    def precioVsMetros() {
        def propiedades = Propiedad.findAllByEstadoNotEqual('vendida', [max: 200, sort: 'fechaCreacion', order: 'desc'])
        
        def data = propiedades.collect {
            [x: it.metrosCuadrados, y: it.precio]
        }

        render([series: [[name: 'Propiedad', data: data]]] as JSON)
    }

    // 6. Gráfico de Líneas: Evolución de Favoritos Agregados por Día/Mes
    def evolucionFavoritos() {
        // Agrupamos por mes para una mejor visualización
        def data = Favorito.list([sort: 'fechaAgregado', order: 'asc'])
            .groupBy { new java.text.SimpleDateFormat("yyyy-MM").format(it.fechaAgregado) }
            .collectEntries { month, favs -> [month, favs.size()] }
            .sort()
            .collect{ month, count -> [x: month, y: count] }
            
        render([series: [[name: 'Favoritos agregados', data: data]]] as JSON)
    }
    def index() {
        // Renderiza la vista principal del dashboard
    }
}