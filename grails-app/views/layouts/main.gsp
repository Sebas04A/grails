<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="MiCasaHoy"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    

     <asset:stylesheet src="bootstrap.css"/>
    <asset:javascript src="jquery-3.3.1.min.js"/>
    <asset:javascript src="bootstrap.js"/>
    <asset:javascript src="bootstrap.bundle.js"/>

    <asset:javascript src="bootbox.js"/>
    <asset:javascript src="fontawesome.all.min.js"/>

    <asset:stylesheet src="bootstrap-datetimepicker.min.css"/>
    <asset:javascript src="moment.js"/>
    <asset:javascript src="moment-with-locales.js"/>
    <asset:javascript src="bootstrap-datetimepicker.min.js"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="styles.css"/>

    <g:layoutHead/>
</head>

<body>

<div id="btn-usuario"><i class="fas fa-user"></i> Perfil</div>

<div id="mobile-menu" class="hidden">
    <ul>
        <li><a href="/">Inicio</a></li>

        <li><a href="/propiedad">Buscar Propiedades</a></li>
    </ul>
</div>
<nav>
    <p id="titulo">Mi Casa Hoy</p>
    <ul id="nav-list">
        <li><a id="actual" href="/">Inicio</a></li>
        <li><a href="/propiedad/list">Buscar Propiedades</a></li>
        
    </ul>
    <div class="d-flex align-items-center h-100">
        <g:if test="${session.usuario}">
            <a href="${createLink(controller:'login', action:'logout')}"
               class="btn btn-outline-warning fw-bold px-3 h-100 d-flex align-items-center">
                Cerrar sesión
            </a>
        </g:if>
        <g:else>
            <a href="${createLink(controller:'login', action:'index')}"
               class="btn btn-outline-light fw-bold px-3 h-100 d-flex align-items-center">
                Iniciar sesión
            </a>
        </g:else>
    </div>


    <div id="hamburguesa" onclick="toggleMenu()">&#9776;</div>
</nav>
<g:layoutBody/>

<footer class="footer">
    <p>&copy; 2024 Venta de Casas. Todos los derechos reservados.</p>
</footer>

<div id="loginForm">
    <div id="container-modo-oscuro">
        <p>Modo Oscuro:</p>
        <div class="dark-mode">
            <div class="circle">
                <ion-icon class="sun" name="sunny"></ion-icon>
                <ion-icon class="moon" name="moon"></ion-icon>
            </div>
        </div>
    </div>
    <div id="contenedor-iniciar-sesion">
        <h2>Iniciar Sesión</h2>
        <form id="form-iniciar-sesion">
            <label for="username">Usuario</label>
            <input
                    type="text"
                    id="username"
                    name="username"
                    placeholder="Ingresa tu usuario"
                    required
            />

            <label for="password">Contraseña</label>
            <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Ingresa tu contraseña"
                    required
            />

            <button id="btn-iniciar-sesion" type="submit">Entrar</button>
        </form>
    </div>
    <div id="contenedor-sesion">
        <ul class="menu-list">
            <li>
                <a href="#mis-me-gusta" class="menu-item"
                ><ion-icon name="heart"></ion-icon> Mis Me Gusta</a
                >
            </li>
            <li>
                <a href="#mis-chats" class="menu-item"
                ><ion-icon name="chatbubbles"></ion-icon> Mis Chats</a
                >
            </li>
            <li>
                <a href="#mis-propiedades" class="menu-item"
                ><ion-icon name="home"></ion-icon> Mis Propiedades</a
                >
            </li>
        </ul>
    </div>
</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

<script>
    function toggleMenu() {
        const menu = document.getElementById("mobile-menu");
        menu.classList.toggle("hidden");
        menu.classList.addClass("active");
    }

    document.getElementById("btn-usuario").addEventListener("click", function () {
       $("#loginForm").toggleClass("active");
    });

    document.querySelector(".dark-mode").addEventListener("click", function () {
        document.body.classList.toggle("dark-mode");
    });
    document.getElementById("form-iniciar-sesion").addEventListener("submit", function (event) {
        event.preventDefault();
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;

        // Aquí puedes agregar la lógica para autenticar al usuario
        console.log("Usuario:", username, "Contraseña:", password);
    });

</script>
</body>
</html>
