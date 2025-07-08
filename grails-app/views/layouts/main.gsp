<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>

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
        <li><a href="/propertiesList">Buscar Propiedades</a></li>
        
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

<div style="min-height: calc(100vh - 10rem)">
    <g:layoutBody/>
</div>

<footer class="footer" style="height:4rem">
    <p>&copy; 2024 Venta de Casas. Todos los derechos reservados.</p>
</footer>
</div>

<g:if test="${session.usuario}">
    <div id="btn-usuario"><i class="fas fa-user"></i> Perfil</div>
</g:if>
<div id="loginForm" class='d-flex flex-column align-items-center justify-content-center'>

    
    <div id="contenedor-sesion" class="card">
        <ul class="menu-list">
            <g:if test="${session.usuario}">
                <li>
                    <a href="/favorito" class="menu-item"
                    > <i class ="fas fa-heart m-2"></i>
                       Mis Favoritos</a
                    >
                </li>
            </g:if>
            <g:if test="${session.usuario?.rol == "admin"}">
                <li>
                    <a href="/propiedad/panel_admin" class="menu-item"
                    >Panel de admin</a
                    >
                </li>
            </g:if>
            <g:if test="${session.usuario?.rol == "vendedor"}">
                <li>
                    <a href="/propiedad/list" class="menu-item"
                    ><i class="fas fa-home"></i>
                    Gestionar Propiedades</a
                    >
                </li>
            </g:if>
            <g:if test="${session.usuario?.rol == "admin"}">
                <li>
                    <a href="/estadisticas" class="menu-item"
                    ><i class="fas fa-chart-bar mr-2
                    "></i>
                    Estadísticas</a
                    >
                </li>
                <li>
                    <a href="/dashboard" class="menu-item"
                    ><i class="fas fa-tachometer-alt mr-2"></i>
                    Dashboard</a
                    >
                </li>
            </g:if>
            
        </ul>
    </div>
</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

<script>
    function toggleMenu() {
        $("#mobile-menu").toggleClass("hidden");
        $("#mobile-menu").toggleClass("active");
    }
    $("#btn-usuario").click(function () {
        $("#loginForm").toggleClass("active");
    });
</script>

</body>
</html>
