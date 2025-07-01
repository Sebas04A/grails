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
        println "propiedad: ${propiedad}"
        [propiedadInstance: propiedad]
    }

    def save_ajax() {
        println "save_ajax"
        def propiedad = params.id ? Propiedad.get(params.id) : new Propiedad()
        // println "params: ${params}"

        propiedad.properties = params
        propiedad.usuario = session.usuario

        println "propiedad después de asignar propiedades: ${propiedad.properties}"

        if (!propiedad.save(flush: true)) {
            println "Error al guardar la propiedad: ${propiedad.errors}"
            render "no"
            return
        }
        println "Propiedad guardada correctamente: ${propiedad.properties}"
        params.list('imagenes').eachWithIndex { imgParams, i ->
        def url = params["imagenes[${i}].urlImagen"]
        def desc = params["imagenes[${i}].descripcion"]

        if (url) {
            def img = new ImagenPropiedad(
                urlImagen: url,
                descripcion: desc,
                propiedad: propiedad
            )
            if (!img.save(flush: true)) {
                println "Error al guardar imagen ${i}: ${img.errors}"
            }
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
}