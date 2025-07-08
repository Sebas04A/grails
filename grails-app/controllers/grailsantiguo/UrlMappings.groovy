package grailsantiguo

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
        "/buscarCasas.gsp"(view: "/buscarCasas")
        "/estadisticas"(controller: 'estadisticas', action: 'index')
        "/favoritos"(controller: "favoritos", action: "index")
        "/favorito" (controller: "favorito", action: "index")


        "/api/dashboard/propiedadesPorTipo"(controller: "dashboard", action: "propiedadesPorTipo")
        "/api/dashboard/distribucionPrecios"(controller: "dashboard", action: "distribucionPrecios")
        "/api/dashboard/topCiudades"(controller: "dashboard", action: "topCiudades")
        "/api/dashboard/topFavoritos"(controller: "dashboard", action: "topFavoritos")
        "/api/dashboard/precioVsMetros"(controller: "dashboard", action: "precioVsMetros")
        "/api/dashboard/evolucionFavoritos"(controller: "dashboard", action: "evolucionFavoritos")
        
    }
}
