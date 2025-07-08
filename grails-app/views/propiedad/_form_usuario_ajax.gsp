<g:form name="frmUsuario"
        url="[controller:'propiedad', action:'save_usuario_ajax']"
        method="POST"
        class="w-100">
    <g:hiddenField name="id" value="${usuario?.id}" />

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="nombre">Nombre</label>
                <g:textField name="nombre" id="nombre" class="form-control" value="${usuario?.nombre ?: ''}" required=""/>
            </div>
            <div class="col-md-6 mb-3">
                <label for="apellido">Apellido</label>
                <g:textField name="apellido" id="apellido" class="form-control" value="${usuario?.apellido ?: ''}" required=""/>
            </div>
            <div class="col-md-6 mb-3">
                <label for="correo">Correo</label>
                <g:textField name="correo" id="correo" type="email" class="form-control" value="${usuario?.correo ?: ''}" required=""/>
            </div>
            <div class="col-md-6 mb-3">
                <label for="rol">Rol</label>
                <g:select name="rol"
                          id="rol"
                          from="${['cliente','admin','vendedor']}"
                          value="${usuario?.rol ?: 'cliente'}"
                          class="form-control"/>
            </div>
            <div class="col-md-6 mb-3">
                <label for="password">Contraseña</label>
                <g:passwordField name="password" id="password" class="form-control" value="" required="${usuario?.id ? false : true}"/>
                <small class="form-text text-muted">
                    <g:if test="${usuario?.id}">
                        Si no desea cambiar la contraseña, deje este campo vacío.
                    </g:if>
                </small>
            </div>
        </div>
    </div>
</g:form>
