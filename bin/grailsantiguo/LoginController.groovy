package grailsantiguo

class LoginController {

    def index() {
        redirect ('action':'login')
    }
    def login(){

    }
    def registrarse(){

    }
    def guardar(Persona persona){
        println "guardar: $persona"
        if (!persona.save(flush: true)) {
            redirect(controller:"Persona",action:"index")
            return
        }
        redirect(controller:"Persona",action:"index")
    }
    def logear(Persona persona){
        println "Persona: $persona"
        redirect(controller:"Persona",action:"index")
    }

    def autenticar() {
        println "Autenticando user : $params.username"

        def usuario = Usuario.findByCorreo(params.username)
        println "Usuario $usuario"
        if( ! usuario){
            flash.message ="Usuario no encontrado"
            redirect(action: 'login')
            return
        }
        println "Contra esperada : $usuario.password  Encontrada $params.password"
        if (usuario.password == params.password) {
            session.usuario = usuario
            redirect(url:"/")
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
        def usuario = new Usuario()

        // Mapear manualmente los campos del formulario
        usuario.nombre = params.nombre
        usuario.apellido = params.apellido
        usuario.correo = params.id_usuario
        usuario.password = params.contrasena
        usuario.rol = 'cliente'
        usuario.fechaRegistro = new Date()

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
