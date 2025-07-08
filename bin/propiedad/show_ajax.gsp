<%@ page import="grailsantiguo.Propiedad" %>

<g:if test="${!propiedadInstance}">
    <elm:notFound elem="Propiedad" genero="a"/>
</g:if>
<g:else>
    <div class="modal-body">
        <div class="container-fluid">

            <!-- Carrusel de Imágenes -->
            <g:if test="${propiedadInstance?.imagenes && propiedadInstance.imagenes.size() > 0}">
                <div id="carouselPropiedad${propiedadInstance?.id}" class="carousel slide mb-4" data-bs-ride="carousel">
                    <div class="carousel-inner rounded shadow">
                        <g:each in="${propiedadInstance.imagenes}" var="img" status="i">
                            <div class="carousel-item ${i == 0 ? 'active' : ''}">
                                <img src="${img?.urlImagen}" class="d-block w-100" alt="Imagen ${i+1}" style="max-height:350px;object-fit:cover;">
                                <g:if test="${img?.descripcion}">
                                    <div class="carousel-caption d-none d-md-block bg-dark bg-opacity-50 rounded-2 p-1">
                                        <span>${img?.descripcion}</span>
                                    </div>
                                </g:if>
                            </div>
                        </g:each>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselPropiedad${propiedadInstance?.id}" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                        <span class="visually-hidden">Anterior</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselPropiedad${propiedadInstance?.id}" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                        <span class="visually-hidden">Siguiente</span>
                    </button>
                </div>
            </g:if>
            <g:else>
                <div class="mb-4 text-center">
                    <img src="https://via.placeholder.com/600x350?text=Sin+imagen" class="img-fluid rounded shadow" style="max-height:350px;">
                    <div class="mt-2 text-muted">Sin imágenes</div>
                </div>
            </g:else>

            <!-- Info Principal -->
            <div class="row mb-2">
                <div class="col-sm-4 fw-bold">Título</div>
                <div class="col-sm-8">${propiedadInstance?.titulo}</div>
            </div>
            <div class="row mb-2">
                <div class="col-sm-4 fw-bold">Tipo</div>
                <div class="col-sm-4 text-capitalize">${propiedadInstance?.tipo}</div>
                <div class="col-sm-4 fw-bold">Estado</div>
                <div class="col-sm-4">${propiedadInstance?.estado}</div>
            </div>
            <div class="row mb-2">
                <div class="col-sm-4 fw-bold">Precio</div>
                <div class="col-sm-4">$ <g:formatNumber number="${propiedadInstance?.precio}" type="currency"/></div>
                <div class="col-sm-4 fw-bold">Metros²</div>
                <div class="col-sm-4">${propiedadInstance?.metrosCuadrados}</div>
            </div>
            <div class="row mb-2">
                <div class="col-sm-4 fw-bold">Dirección</div>
                <div class="col-sm-8">${propiedadInstance?.direccion}</div>
            </div>
            <div class="row mb-2">
                <div class="col-sm-4 fw-bold">Ciudad</div>
                <div class="col-sm-4">${propiedadInstance?.ciudad}</div>
                <div class="col-sm-4 fw-bold">Provincia</div>
                <div class="col-sm-4">${propiedadInstance?.provincia}</div>
                <div class="col-sm-4 fw-bold">País</div>
                <div class="col-sm-4">${propiedadInstance?.pais}</div>
            </div>
            <div class="row mb-2">
                <div class="col-sm-4 fw-bold">Descripción</div>
                <div class="col-sm-8">${propiedadInstance?.descripcion}</div>
            </div>
            <div class="row mb-2">
                <div class="col-sm-4 fw-bold">Usuario</div>
                <div class="col-sm-8">${propiedadInstance?.usuario?.nombre} ${propiedadInstance?.usuario?.apellido} (${propiedadInstance?.usuario?.correo})</div>
            </div>
            <div class="row mb-2">
                <div class="col-sm-4 fw-bold">Fecha de creación</div>
                <div class="col-sm-8">
                    <g:formatDate date="${propiedadInstance?.fechaCreacion}" format="dd-MM-yyyy HH:mm"/>
                </div>
            </div>

            <!-- Detalles Habitacionales -->
            <g:if test="${propiedadInstance?.propiedadHabitacional}">
                <hr/>
                <h5 class="mt-3 mb-3 text-primary fw-bold">Detalles habitacionales</h5>
                <div class="d-flex flex-wrap gap-3 justify-content-center">
                    <div class="card shadow-sm border-0 text-center" style="min-width: 160px; max-width: 180px;">
                        <div class="card-body py-3 px-2 d-flex flex-column align-items-center">
                            <div class="fw-bold small" style="font-size: 0.98rem; line-height:1.1;"># Pisos</div>
                            <div class="fs-4">${propiedadInstance?.propiedadHabitacional?.numeroPisos}</div>
                        </div>
                    </div>
                    <div class="card shadow-sm border-0 text-center" style="min-width: 160px; max-width: 180px;">
                        <div class="card-body py-3 px-2 d-flex flex-column align-items-center">
                            <div class="fw-bold small" style="font-size: 0.98rem; line-height:1.1;"># Balcones</div>
                            <div class="fs-4">${propiedadInstance?.propiedadHabitacional?.numeroBalcones}</div>
                        </div>
                    </div>
                    <div class="card shadow-sm border-0 text-center" style="min-width: 160px; max-width: 180px;">
                        <div class="card-body py-3 px-2 d-flex flex-column align-items-center">
                            <div class="fw-bold small" style="font-size: 0.98rem; line-height:1.1;"># Estacionamientos</div>
                            <div class="fs-4">${propiedadInstance?.propiedadHabitacional?.numeroEstacionamientos}</div>
                        </div>
                    </div>
                    <div class="card shadow-sm border-0 text-center" style="min-width: 160px; max-width: 180px;">
                        <div class="card-body py-3 px-2 d-flex flex-column align-items-center">
                            <div class="fw-bold small" style="font-size: 0.98rem; line-height:1.1;"># Medios Baños</div>
                            <div class="fs-4">${propiedadInstance?.propiedadHabitacional?.numeroMediosBanos}</div>
                        </div>
                    </div>
                    <div class="card shadow-sm border-0 text-center" style="min-width: 160px; max-width: 180px;">
                        <div class="card-body py-3 px-2 d-flex flex-column align-items-center">
                            <div class="fw-bold small" style="font-size: 0.98rem; line-height:1.1;"># Baños Completos</div>
                            <div class="fs-4">${propiedadInstance?.propiedadHabitacional?.numeroBanos}</div>
                        </div>
                    </div>
                    <div class="card shadow-sm border-0 text-center" style="min-width: 160px; max-width: 180px;">
                        <div class="card-body py-3 px-2 d-flex flex-column align-items-center">
                            <div class="fw-bold small" style="font-size: 0.98rem; line-height:1.1;"># Habitaciones</div>
                            <div class="fs-4">${propiedadInstance?.propiedadHabitacional?.numeroHabitaciones}</div>
                        </div>
                    </div>
                </div>
            </g:if>




        </div>
    </div>
</g:else>
