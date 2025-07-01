<!-- grails-app/views/login/registro.gsp -->
<!DOCTYPE html>
<html>
<head>
    <title>Registro</title>
    <meta name="layout" content="main"/>
</head>
<!-- grails-app/views/login/registro.gsp -->
<body>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="text-center mb-4">Registro de Usuario</h2>

            <g:if test="${flash.message}">
                <div class="alert alert-success">${flash.message}</div>
            </g:if>

            <g:hasErrors bean="${usuario}">
                <div class="alert alert-danger">
                    <ul>
                        <g:eachError bean="${usuario}" var="error">
                            <li><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>

            <g:form action="guardarRegistro" class="card p-4 shadow-sm">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre</label>
                    <g:textField name="nombre" id="nombre" value="${usuario?.nombre}" class="form-control" placeholder="Ingresa tu nombre" required=""/>
                </div>

                <div class="mb-3">
                    <label for="apellido" class="form-label">Apellido</label>
                    <g:textField name="apellido" id="apellido" value="${usuario?.apellido}" class="form-control" placeholder="Ingresa tu apellido" required=""/>
                </div>
                <div class="mb-3">
                    <label for="id_usuario" class="form-label">Usuario</label>
                    <g:textField name="id_usuario" id="id_usuario" value="${usuario?.correo}" class="form-control" placeholder="Crea tu usuario" required=""/>
                </div>

                <div class="mb-3">
                    <label for="contrasena" class="form-label">Contraseña</label>
                    <g:passwordField name="contrasena" id="contrasena" class="form-control" placeholder="Crea tu contraseña" required=""/>
                </div>

                <button type="submit" class="btn btn-success w-100">Registrarse</button>
            </g:form>

            <div class="text-center mt-3">
                ¿Ya tienes cuenta? <g:link action="index">Inicia sesión</g:link>
            </div>
        </div>
    </div>
</body>

</html>
