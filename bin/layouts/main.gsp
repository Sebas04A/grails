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
<style>
html, body {
  height: 100%;
  min-height: 100vh;
  margin: 0;
  padding: 0;
}
body {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}
// .footer {
//   margin-top: 350px; /* Sticky abajo */
//   background: #22303c;
//   color: #fff;
//   text-align: center;
//   padding: 1rem 0;
//   width: 100%;
// }
#btn-usuario {
  position: fixed;
  bottom: 5rem;  /* Encima del footer */
  right: 2rem;
  background: #22303c;
  color: #fff;
  padding: 0.75rem 1.5rem;
  border-radius: 25px;
  font-weight: bold;
  box-shadow: 0 2px 8px rgba(0,0,0,0.18);
  z-index: 1100;
  cursor: pointer;
  transition: background .2s;
}
#btn-usuario:hover {
  background: #1777e6;
}
/* Opcional para el menú loginForm */
#loginForm.active {
  bottom: 4.5rem;
}

.main-content {
    margin-top: 95px; /* Ajusta según tu header */
}
.main-content {
    margin-top: 90px; /* Ajusta a la altura real de tu nav */
}

</style>


<body>
<div class="main-content">
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
<g:layoutBody/>

<footer class="footer">
    <p>&copy; 2024 Venta de Casas. Todos los derechos reservados.</p>
</footer>
</div>

<div id="loginForm">

    
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
            <g:if test="${session.usuario}">
                <li>
                    <a href="#mis-favoritos" class="menu-item"
                    ><ion-icon name="star"></ion-icon> Mis Favoritos</a
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
   

</script>

</body>
</html>
