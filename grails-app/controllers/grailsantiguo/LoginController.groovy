package grailsantiguo

class LoginController {

    def index() {
        redirect ('action':'login')
    }
    def login(){

    }
    def registrarse(){

    }



    def autenticar() {
        println "Autenticando user : $params.username"

        def usuario = Usuario.findByCorreo(params.username)
        println "Usuario $usuario"
        if (!usuario) {
            flash.message = "Usuario no encontrado"
            redirect(action: 'login')
            return
        }
        println "Contra esperada : $usuario.password  Encontrada $params.password"
        if (usuario.password == params.password) {
            session.usuario = usuario
            if (usuario.rol == 'admin') {
                // Redireccionar al panel admin (listado de propiedades)
                redirect(controller: 'propiedad', action: 'panel_admin')
            } else {
                // Redireccionar a la página principal (o donde desees)
                redirect(url: "/")
            }
        } else {
            println "Incorrecto"
            flash.message = "Usuario o contraseña incorrecta"
            redirect(action: 'login')
        }
    }


    def logout() {
        session.invalidate()
        redirect(action: 'index')
    }
    def registro() {
        render view: 'registro'
    }

    def guardarRegistro() {
        println "Guardar registro con params: ${params}"
        if (params.contrasena != params.contrasena2) {
            flash.message = "Las contraseñas no coinciden"
            render view: 'registro', model: [usuario: params]
            return
        }

        def usuario = new Usuario()



        // Mapear manualmente los campos del formulario
        usuario.nombre = params.nombre
        usuario.apellido = params.apellido
        usuario.correo = params.id_usuario
        usuario.password = params.contrasena
        usuario.rol = params.rol ?: 'cliente' // Asignar rol por defecto si no se especifica
        usuario.fechaRegistro = new Date()

        println "Guardando usuario: ${usuario.properties}"

        println "Usuario $usuario"
        if (!usuario.validate()) {
            println "Error formulario"
            render view: 'registro', model: [usuario: usuario]
            return
        }

        usuario.save(flush: true)
        flash.message = "Registro exitoso, puedes iniciar sesión."
        redirect(action: 'login')
    }
}
