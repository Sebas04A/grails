<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet href="casa.css"/>
</head>
<body>
<main>
    <!-- Título y precio -->
    <div id="header-casa">
        <h2>${propiedad?.titulo}</h2>
        <p id="precio">$${String.format('%,.2f', propiedad?.precio)}</p>
    </div>

    <!-- Galería de imágenes -->
    <section class="casa-detalle">
        <div class="imagenes-casa">
            <div id="imagenes-principales" class="flex-imagenes">
                <g:each in="${propiedad?.imagenes?.take(2)}" var="img">
                    <div class="image-container">
                        <img src="${img.urlImagen}"
                            alt="Imagen principal de la casa"
                            class="imagenes-principales" />
                    </div>
                </g:each>
            </div>

            <div id="imagenes-secundarias" class="flex-imagenes">
                <g:each in="${propiedade?.imagenes?.drop(2)}" var="img" status="i">
                    <div class="image-container ${i == propriedade.imagenes.size() - 3 ? 'ultima-imagen' : ''}">
                        <img src="${img.urlImagen}"
                            alt="Imagen secundaria de la casa" />
                        <g:if test="${i == propriedade.imagenes.size() - 3}">
                            <div class="ver-mas">+${propiedade.imagenes.size() - 5}</div>
                        </g:if>
                    </div>
                </g:each>
            </div>
        </div>


        <!-- Información principal -->
        <g:if test="${propiedad.propiedadHabitacional}">
            <div class="info-casa">
                <div class="detalle habitaciones">${propiedad.propiedadHabitacional.numeroHabitaciones} Habitaciones</div>
                <div class="detalle banos">${propiedad.propiedadHabitacional.numeroBanos} Baños</div>
            </div>
        </g:if>

        <!-- Descripción -->
        <div class="descripcion-y-agente">
            <g:if test="${propiedad.propiedadHabitacional}">
                
            <div class="descripcion">
                <p>${propiedad?.descripcion}</p>
                <ul>
                    <li>🛁 ${propiedad.propiedadHabitacional.numeroBanos} Baños</li>
                    <li>🚗 Estacionamiento: ${propiedad.propiedadHabitacional.numeroEstacionamientos}</li>
                    <li>🏠 Pisos: ${propiedad.propiedadHabitacional.numeroPisos}</li>
                    <li>🌳 Balcones: ${propiedad.propiedadHabitacional.numeroBalcones} m²</li>
                    <li>🌞 Medios Banos: ${propiedad.propiedadHabitacional.numeroMediosBanos} m²</li>
                </ul>
            </div>
            
            </g:if>

            <!-- Agente -->
            <aside class="agente-info">
                <div class="agente-detalle">
                    
                    <div>
                        <p>${(propiedad.usuario.nombre).toUpperCase()}</p>
                        <p>${(propiedad.usuario.apellido).toUpperCase()}</p>
                        <p>
                            <a href="mailto:${propiedad.usuario.correo}">${propiedad.usuario.correo}</a>
                        </p>
                    </div>
                </div>
                <button onclick="location.href='mailto:${propiedad.usuario.correo}'" class="btn-contacto">
                    Contactar
                </button>
            </aside>
        </div>
    </section>

    <!-- Mapa -->
    <div class="mapa-casa contenedor-seccion">
        <h3 class="subtitulo">Ubicación en el Mapa</h3>
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d838.510935058896!2d-78.48891246002896!3d-0.20599938187256608!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2sec!4v1733413526043!5m2!1ses!2sec"
               height="450"
                style="border: 0"
                allowfullscreen=""
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>

    <!-- Modal y Galería -->
    <div id="modal" class="modal" onclick="closeModal()">
        <span class="close" onclick="closeModal()">&times;</span>
        <img id="modalImage" src="" alt="Imagen en grande" />
    </div>
    <div id="galeriaLightbox" class="galeria-overlay">
        <div id="galeria-contenido">
            <div id="cabecera-galeria">
                <span class="cerrar-galeria">&times;</span>
                <h3 id="nombre-casa-galeria">${propiedad?.titulo}</h3>
                <div id="agente-galeria">
                    <div>
                        <p>Gustavito David</p>
                    </div>
                    <img src="${resource(dir:'images', file:'gustavitoDavidTraje-removebg-preview.png')}"
                         alt="Foto del Agente"
                         class="agente-foto-galeria" />
                </div>
            </div>
            <div id="miniaturasContainer">
                <div class="elemento-galeria-seleccion">
                    <img src="${resource(dir:'images', file:'casa1.jpg')}" alt="Miniatura 1" />
                    <p>Exterior</p>
                </div>
                <!-- más miniaturas aquí -->
            </div>
            <div id="galeria-container">
                <img class="four-grid-cells" src="${resource(dir:'images', file:'casa1.jpg')}" alt="Imagen principal" />
                <!-- más imágenes -->
            </div>
        </div>
    </div>
</main>
<script>
    function closeModal() {
        document.getElementById('modal').style.display = 'none';
    }

    function openModal(imageSrc) {
        $('#modalImage').attr('src', imageSrc);
        $('#modal').css('display', 'flex');
    }
    $(".image-container").click(function() {
        const imageSrc = $(this).attr("src");
        openModal(imageSrc);
    });
</script>
</body>
</html>