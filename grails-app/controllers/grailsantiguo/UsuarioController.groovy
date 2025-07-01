package grailsantiguo

class UsuarioController {

    def index() {
        respond Usuario.list(sort: "id", order: "desc")
    }

    def show(Long id) {
        respond Usuario.get(id)
    }

    def create() {
        respond new Usuario()
    }

    def save() {
        def usuario = new Usuario(params)

        if (!usuario.validate()) {
            render view: 'create', model: [usuario: usuario]
            return
        }

        usuario.save(flush: true)
        flash.message = "Usuario creado exitosamente"
        redirect(action: 'index')
    }

    def edit(Long id) {
        respond Usuario.get(id)
    }

    def update(Long id) {
        def usuario = Usuario.get(id)
        if (!usuario) {
            flash.message = "Usuario no encontrado"
            redirect(action: 'index')
            return
        }

        usuario.properties = params

        if (!usuario.validate()) {
            render view: 'edit', model: [usuario: usuario]
            return
        }

        usuario.save(flush: true)
        flash.message = "Usuario actualizado"
        redirect(action: 'index')
    }

    def delete(Long id) {
        def usuario = Usuario.get(id)
        if (usuario) {
            usuario.delete(flush: true)
            flash.message = "Usuario eliminado"
        } else {
            flash.message = "Usuario no encontrado"
        }
        redirect(action: 'index')
    }
}
