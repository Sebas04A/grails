package grailsantiguo


class WardInterceptor {
    WardInterceptor() {
        matchAll().excludes(
            controller: 'login',
            action: 'index'
        ).excludes(
            controller: 'propertiesList',
            action: 'index'
        ).excludes(
            controller: 'inicio',
            action: 'index')
    }

    boolean before() { 
        println "Interceptor: Ejecutando antes de la acción del controlador ${controllerName} - ${actionName}"
        def excludedControllers = [
            'login','propertiesList'
        ]
        def adminControllers = [
            'admin', 'estadisticas', 'usuarios', 'propiedades'
        ]
        if (!controllerName || !actionName) {
            println "Interceptor: No se ha especificado un controlador o acción válida."
            return true // Permitir el acceso si no hay controlador o acción
        }
        if (controllerName in excludedControllers) {
            return true
        }

        if (!session.usuario) {
            flash.message = "Por favor, inicia sesión para continuar."
            redirect(controller: 'login', action: 'index')
            return false
        }
        if (controllerName in adminControllers && session.usuario.rol != 'admin') {
            flash.message = "Acceso denegado. Solo los administradores pueden acceder a esta sección."
            redirect(controller: 'propiedad', action: 'list')
            return false
        }
        return true
     }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
