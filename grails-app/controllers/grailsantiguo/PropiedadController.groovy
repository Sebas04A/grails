package grailsantiguo

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

import groovy.sql.Sql

class PropiedadController {

    def dataSource

    def conectaDb() {
        Sql sql = new Sql(dataSource)
        return sql
    }

    def list() {
        def propiedades = Propiedad.list([sort: 'titulo'])
        [propiedades: propiedades]
    }

    def form_ajax() {
        def propiedad = params.id ? Propiedad.get(params.id) : new Propiedad()
        def imagenes = propiedad?.imagenes  // Suponiendo que la relación es hasMany
        [propiedadInstance: propiedad, imagenes: imagenes]
    }


    def save_ajax() {
        println "save_ajax"
        println "params: ${params}"

        def propiedad = params.id ? Propiedad.get(params.id) : new Propiedad()
        propiedad.properties = params

        // Conversión explícita de campos numéricos
        if (params.precio) {
            propiedad.precio = params.precio as BigDecimal
        }
        if (params.metrosCuadrados) {
            propiedad.metrosCuadrados = params.metrosCuadrados as BigDecimal
        }

        // Asignación manual de Strings simples para evitar nulls
        propiedad.titulo = params.titulo?.trim()
        propiedad.descripcion = params.descripcion?.trim()
        propiedad.tipo = params.tipo?.trim()
        propiedad.estado = params.estado?.trim()
        propiedad.direccion = params.direccion?.trim()
        propiedad.ciudad = params.ciudad?.trim()
        propiedad.provincia = params.provincia?.trim()
        propiedad.pais = params.pais?.trim()

        // Buscar usuario por correo
        def usuario = Usuario.findByCorreo(params.usuario?.trim())
        if (!usuario) {
            render "Usuario no encontrado: ${params.usuario}"
            return
        }
        propiedad.usuario = usuario

        // Guardar propiedad primero
        if (!propiedad.save(flush: true)) {
            println "Error al guardar la propiedad: ${propiedad.errors}"
            render "no"
            return
        }

        // Guardar o actualizar PropiedadHabitacional SOLO si hay datos enviados
        if (
            params["propiedadHabitacional.numeroPisos"] ||
            params["propiedadHabitacional.numeroBalcones"] ||
            params["propiedadHabitacional.numeroEstacionamientos"] ||
            params["propiedadHabitacional.numeroMediosBanos"] ||
            params["propiedadHabitacional.numeroBanos"] ||
            params["propiedadHabitacional.numeroHabitaciones"]
        ) {
            def phParams = [
                numeroPisos: params["propiedadHabitacional.numeroPisos"] ? params["propiedadHabitacional.numeroPisos"] as Integer : null,
                numeroBalcones: params["propiedadHabitacional.numeroBalcones"] ? params["propiedadHabitacional.numeroBalcones"] as Integer : null,
                numeroEstacionamientos: params["propiedadHabitacional.numeroEstacionamientos"] ? params["propiedadHabitacional.numeroEstacionamientos"] as Integer : null,
                numeroMediosBanos: params["propiedadHabitacional.numeroMediosBanos"] ? params["propiedadHabitacional.numeroMediosBanos"] as Integer : null,
                numeroBanos: params["propiedadHabitacional.numeroBanos"] ? params["propiedadHabitacional.numeroBanos"] as Integer : null,
                numeroHabitaciones: params["propiedadHabitacional.numeroHabitaciones"] ? params["propiedadHabitacional.numeroHabitaciones"] as Integer : null
            ]
            def propiedadHabitacional

            if (params["propiedadHabitacional.id"]) {
                propiedadHabitacional = PropiedadHabitacional.get(params["propiedadHabitacional.id"])
                if (!propiedadHabitacional) {
                    propiedadHabitacional = new PropiedadHabitacional()
                }
            } else {
                propiedadHabitacional = new PropiedadHabitacional()
            }

            propiedadHabitacional.properties = phParams
            propiedadHabitacional.propiedad = propiedad
            if (!propiedad.save(flush: true)) {
                println "Error al guardar la propiedad: ${propiedad.errors?.allErrors}"
                propiedad.errors?.allErrors?.each {
                    println it
                }
                render "no"
                return
            }
            propiedad.propiedadHabitacional = propiedadHabitacional
            propiedad.save(flush: true)
        }
        def imagenesAEliminar = params.list("imagenesAEliminar[]")
            imagenesAEliminar?.each { idImg ->
                def img = ImagenPropiedad.get(idImg as Long)
                if (img) {
                    img.delete(flush: true)
                }
                }
        // Guardar imágenes
        println "Imagenes params : ${params.findAll { it.key.startsWith('imagenes[') }}"
        def urls = params.list("imagenes[].urlImagen")
        def descripciones = params.list("imagenes[].descripcion")

        urls.eachWithIndex { url, idx ->
            if (url) {
                def desc = descripciones?.getAt(idx)
                def imagen = new ImagenPropiedad(
                    propiedad: propiedad,
                    urlImagen: url,
                    descripcion: desc
                )
                if (!imagen.save(flush: true)) {
                    println "Error al guardar imagen ${idx}: ${imagen.errors}"
                }
                println "Imagen guardada correctamente: ${imagen.properties}"
            }
        }

        render "ok"
    }


    def show_ajax() {
        println "show_ajax"
        println "params: ${params}"
        def propiedad = Propiedad.get(params.id)
        [propiedadInstance: propiedad]
    }

    def delete_ajax() {
        def propiedad = Propiedad.get(params.id)
        propiedad?.delete(flush: true)
        render "ok"
    }

    def buscar_ajax() {
        println "buscar ajax"
        def criterio = params.criterio?.trim()
        def cr = "%${criterio}%"
        def propiedades = Propiedad.findAllByTituloLikeOrDescripcionLike(cr, cr, [sort: 'titulo'])
        println "propiedades: ${propiedades.size()}"
        render(view: 'buscar_ajax', model: [propiedades: propiedades, contador: propiedades.size()])
    }



// Mostrar panel de administración
def panel_admin() {
    // Solo admin debería acceder aquí, idealmente
    if (!session.usuario || session.usuario.rol != 'admin') {
        flash.message = "No autorizado"
        redirect(view:"/index")
        return
    }
    render(view: 'panel_admin')
}

// Acción ejemplo para administrar usuarios
def administrar_usuarios() {
    // Solo admin puede acceder (buena práctica)
    if (!session.usuario || session.usuario.rol != 'admin') {
        flash.message = "No autorizado"
        redirect(controller: 'propiedad', action: 'list')
        return
    }
    def usuarios = Usuario.list(sort: 'nombre', order: 'asc')
    [usuarios: usuarios]
}

// Para buscar usuarios AJAX (tabla parcial)
def buscar_usuarios_ajax() {
    def criterio = params.criterio?.trim()
    def usuarios = Usuario.createCriteria().list {
        if (criterio) {
            or {
                ilike("nombre", "%${criterio}%")
                ilike("apellido", "%${criterio}%")
                ilike("correo", "%${criterio}%")
                ilike("rol", "%${criterio}%")
            }
        }
        order('nombre', 'asc')
    }
    render(template: 'tabla_usuarios_ajax', model: [usuarios: usuarios])
}

def form_usuario_ajax() {
    def usuario = params.id ? Usuario.get(params.id) : new Usuario()
    if (!usuario) {
        render "ERROR*No se encontró el usuario"
        return
    }
    render(template: "form_usuario_ajax", model: [usuario: usuario])
}



// Mostrar usuario AJAX
def show_usuario_ajax() {
    def usuario = Usuario.get(params.id)
    render(template: 'show_usuario_ajax', model: [usuario: usuario])
}

def save_usuario_ajax() {
    println "save_usuario_ajax"
    println "params: ${params}"
    def usuario = params.id ? Usuario.get(params.id) : new Usuario()

    usuario.nombre = params.nombre
    usuario.apellido = params.apellido
    usuario.correo = params.correo
    usuario.rol = params.rol ?: usuario.rol

    // Password
    if (params.id) {
        // Edición: solo cambiar si se ingresó una nueva contraseña
        if (params.password?.trim()) {
            usuario.password = params.password
        }
        // si no, mantener la actual (no cambies nada)
    } else {
        // Nuevo usuario: password obligatorio
        usuario.password = params.password
    }

    if (!usuario.save(flush: true)) {
        render usuario.errors.allErrors*.defaultMessage.join('; ')
        return
    }
    render "ok"
}



// Eliminar usuario AJAX
def delete_usuario_ajax() {
    def usuario = Usuario.get(params.id)
    try {
        usuario.delete(flush: true)
        render "ok"
    } catch(e) {
        render "no"
    }
}



}