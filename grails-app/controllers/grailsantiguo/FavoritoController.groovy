package grailsantiguo
import grails.converters.JSON


class FavoritoController {

    def index() {
        // Obtener el usuario actual de la sesión
        def usuarioId = session.usuario?.id
        
        if (!usuarioId) {
            flash.error = "Debe iniciar sesión para ver sus favoritos"
            redirect(controller: 'login', action: 'index')
            return
        }
        
        // Obtener todos los favoritos del usuario con las propiedades e imágenes asociadas
        def favoritos = Favorito.createCriteria().list {
            eq('usuario.id', usuarioId)
            join 'propiedad'
            propiedad {
                join 'imagenes'
            }
            order('fechaAgregado', 'desc')
        }
        
        [favoritos: favoritos, totalFavoritos: favoritos.size()]
    }
    
    def eliminar() {
        def favoritoId = params.id
        def usuarioId = session.usuario?.id
        
        if (!usuarioId) {
            flash.error = "Debe iniciar sesión"
            redirect(controller: 'login', action: 'index')
            return
        }
        
        if (!favoritoId) {
            flash.error = "ID de favorito no válido"
            redirect(action: 'index')
            return
        }
        
        try {
            // Buscar el favorito que pertenece al usuario actual
            def favorito = Favorito.createCriteria().get {
                eq('id', favoritoId as Long)
                eq('usuario.id', usuarioId)
            }
            
            if (favorito) {
                def tituloPropiedad = favorito.propiedad.titulo
                favorito.delete(flush: true)
                flash.success = "La propiedad '${tituloPropiedad}' ha sido eliminada de sus favoritos"
            } else {
                flash.error = "No se encontró el favorito o no tiene permisos para eliminarlo"
            }
            
        } catch (Exception e) {
            flash.error = "Error al eliminar el favorito: ${e.message}"
        }
        
        redirect(action: 'index')
    }
    
    def agregar() {
        def propiedadId = params.propiedadId
        def usuarioId = session.usuario?.id
        
        if (!usuarioId) {
            render(contentType: 'application/json') {
                [success: false, message: 'Debe iniciar sesión']
            }
            return
        }
        
        if (!propiedadId) {
            render(contentType: 'application/json') {
                [success: false, message: 'ID de propiedad no válido']
            }
            return
        }
        
        try {
            def usuario = Usuario.get(usuarioId)
            def propiedad = Propiedad.get(propiedadId)
            
            if (!usuario || !propiedad) {
                render(contentType: 'application/json') {
                    [success: false, message: 'Usuario o propiedad no encontrados']
                }
                return
            }
            
            // Verificar si ya existe en favoritos
            def favoritoExistente = Favorito.createCriteria().get {
                eq('usuario', usuario)
                eq('propiedad', propiedad)
            }
            
            if (favoritoExistente) {
                render(contentType: 'application/json') {
                    [success: false, message: 'Esta propiedad ya está en sus favoritos']
                }
                return
            }
            
            // Crear nuevo favorito
            def favorito = new Favorito(usuario: usuario, propiedad: propiedad)
            favorito.save(flush: true)
            
            render(contentType: 'application/json') {
                [success: true, message: 'Propiedad agregada a favoritos']
            }
            
        } catch (Exception e) {
            render(contentType: 'application/json') {
                [success: false, message: "Error al agregar a favoritos: ${e.message}"]
            }
        }
    }
    def toggle() {
        println "toggle favorito"
        println "params: ${params}"
        def propiedadId = params.propiedadId
        def usuarioId = session.usuario?.id
        
        
        if (!usuarioId) {
            render([success: false, message: 'Debe iniciar sesión'] as JSON)
            return
        }
        println "usuarioId: ${usuarioId}, propiedadId: ${propiedadId}"
        
        if (!propiedadId) {
            render([success: false, message: 'ID de propiedad no válido'] as JSON)
            return
        }
        
        try {
            def usuario = Usuario.get(usuarioId)
            def propiedad = Propiedad.get(propiedadId)
            println "usuario: ${usuario}, propiedad: ${propiedad}"
            
            if (!usuario || !propiedad) {
                render([success: false, message: 'Usuario o propiedad no encontrados'] as JSON)
                return
            }
            
            // Verificar si ya existe en favoritos
            def favoritoExistente = Favorito.createCriteria().get {
                eq('usuario', usuario)
                eq('propiedad', propiedad)
            }
            
            if (favoritoExistente) {
                // Si existe, lo eliminamos
                favoritoExistente.delete(flush: true)
                render([success: true, action: 'removed', message: 'Eliminado de favoritos'] as JSON)
            } else {
                // Si no existe, lo creamos
                def favorito = new Favorito(usuario: usuario, propiedad: propiedad)
                favorito.save(flush: true)
                render([success: true, action: 'added', message: 'Agregado a favoritos'] as JSON)
            }
            
        } catch (Exception e) {
            render([success: false, message: "Error al procesar favorito: ${e.message}"] as JSON)
        }
    }
}