<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <asset:stylesheet src="login.css"/>
    <meta name="layout" content="main"/>
</head>
<!-- grails-app/views/login/login.gsp -->
<body>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <h2 class="text-center mb-4">Iniciar Sesión</h2>

            <g:if test="${flash.message}">
                <div class="alert alert-danger">${flash.message}</div>
            </g:if>

            <g:form controller="login" action="autenticar" method="POST" class="card p-4 shadow-sm">
                <div class="mb-3">
                    <label for="username" class="form-label">Usuario</label>
                    <g:textField name="username" id="username" class="form-control" placeholder="Ingresa tu usuario" required=""/>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña</label>
                    <div class="input-group">
                        <g:passwordField name="password" id="password" class="form-control" placeholder="Ingresa tu contraseña" required=""/>
                        <span class="input-group-text">
                            <i class="bi bi-eye-slash" onclick="togglePassword()"></i>
                        </span>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100">Entrar</button>
            </g:form>

            <div class="text-center mt-3">
                ¿No tienes cuenta? <g:link action="registro">Regístrate aquí</g:link>
            </div>
        </div>
    </div>

    <script>
        function togglePassword() {
            const input = document.getElementById('password');
            input.type = input.type === 'password' ? 'text' : 'password';
        }
    </script>
</body>

</html>