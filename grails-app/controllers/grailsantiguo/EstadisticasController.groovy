package grailsantiguo

class EstadisticasController {

    def index() {
        def usuariosPorRol = Usuario.createCriteria().list {
            projections {
                groupProperty("rol")
                count("id")
            }
        }

        def propiedadesPorEstado = Propiedad.createCriteria().list {
            projections {
                groupProperty("estado")
                count("id")
            }
        }

        def ciudadesConMasPropiedades = Propiedad.createCriteria().list {
            projections {
                groupProperty("ciudad")
                count("id", "cantidad")
            }
            order("cantidad", "desc")
            maxResults(5)
        }

        def promedioPrecioPorTipo = Propiedad.createCriteria().list {
            projections {
                groupProperty("tipo")
                avg("precio")
            }
        }

        def topFavoritos = Favorito.createCriteria().list {
            createAlias("propiedad", "p")
            projections {
                groupProperty("p.titulo")
                count("id", "cantidad")
            }
            order("cantidad", "desc")
            maxResults(5)
        }

        render(view: "index", model: [
                usuariosPorRol         : usuariosPorRol,
                propiedadesPorEstado   : propiedadesPorEstado,
                ciudadesConMasPropiedades: ciudadesConMasPropiedades,
                promedioPrecioPorTipo  : promedioPrecioPorTipo,
                topFavoritos           : topFavoritos
        ])
    }

}
