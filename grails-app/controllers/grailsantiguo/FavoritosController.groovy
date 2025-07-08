package grailsantiguo

class FavoritosController {

    /**
     * Muestra la lista de propiedades favoritas del usuario actual.
     */
    def index() {
        // Asumimos que el objeto 'usuario' se guarda en la sesión después del login.
        def usuarioActual = session.usuario
        
        if (!usuarioActual) {
            flash.message = "Por favor, inicie sesión para ver sus propiedades favoritas."
            redirect(controller: 'login', action: 'index') // Ajusta al nombre de tu controlador de login
            return
        }

        // Buscamos todos los favoritos que pertenecen al usuario actual.
        def favoritos = Favorito.findAllByUsuario(usuarioActual, [sort: 'fechaAgregado', order: 'desc'])

        // Pasamos la lista de favoritos a la vista.
        [favoritos: favoritos]
    }

    /**
     * Elimina una propiedad de la lista de favoritos.
     * La transacción se maneja manualmente con withTransaction.
     */
    def eliminar(Long id) {
        if (id == null) {
            notFound()
            return
        }

        def usuarioActual = session.usuario
        if (!usuarioActual) {
            flash.error = "Acceso denegado. Debe iniciar sesión para realizar esta acción."
            redirect(controller: 'login', action: 'index')
            return
        }

        def favorito = Favorito.get(id)

        if (!favorito) {
            notFound()
            return
        }

        // Verificación de seguridad para asegurar que el favorito pertenece al usuario actual.
        if (favorito.usuario.id == usuarioActual.id) {
            // Manejo manual de la transacción en lugar de usar @Transactional
            Favorito.withTransaction { status ->
                try {
                    favorito.delete(flush: true)
                    flash.success = "Propiedad eliminada de tus favoritos correctamente."
                } catch (Exception e) {
                    // Si hay un error, revertimos la transacción.
                    status.setRollbackOnly()
                    flash.error = "Ocurrió un error al eliminar la propiedad de tus favoritos."
                    // Usamos println para registrar el error en la consola en lugar de 'log'.
                    println "Error al eliminar favorito con ID ${id}: ${e.message}"
                }
            }
        } else {
            flash.error = "No tienes permiso para realizar esta acción."
        }

        redirect(action: 'index')
    }

    /**
     * Maneja el caso en que no se encuentra un favorito con el ID proporcionado.
     */
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.error = "Favorito no encontrado con el ID '${params.id}'"
                redirect action: "index", method: "GET"
            }
            '*'{ render status: 404 } // NOT_FOUND
        }
    }
}