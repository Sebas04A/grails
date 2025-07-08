<!-- grails-app/views/propiedad/index.gsp -->
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet href="propiedades.css"/>
     <style>
        // body { background-color: #f2f6fc; }
      .card { border: none; border-radius: 1rem; }
      .form-control, .form-select { border-radius: .75rem; }
      .btn { border-radius: .75rem; font-weight: 500; }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
      <div class="col-xl-8 col-lg-9 col-md-10">
        <div class="card shadow-sm">
          <div class="card-body px-5 py-5">
            <h4 class="card-title text-center mb-4">🔍 Buscar propiedades</h4>

            <g:form method="get" controller="propertiesList" action="index">
              
              <!-- Búsqueda general -->
              <div class="row g-3 mb-4">
                <div class="col-12">
                  <div class="form-floating">
                    <g:textField 
                      name="q" value="${params.q}" 
                      class="form-control" id="buscarGeneral" 
                      placeholder="Buscar..." 
                    />
                    <label for="buscarGeneral">
                      Título, ciudad, provincia…
                    </label>
                  </div>
                </div>

                <!-- Tipo / Estado -->
                <div class="col-sm-6 col-md-4">
                  <div class="form-floating">
                    <g:select 
                      name="tipo" from="${['','casa','departamento','terreno','local']}"
                      value="${params.tipo}" 
                      class="form-select" id="tipo" 
                    />
                    <label for="tipo">Tipo</label>
                  </div>
                </div>
                <div class="col-sm-6 col-md-4">
                  <div class="form-floating">
                    <g:select 
                      name="estado" from="${['','en venta','alquiler','vendida']}"
                      value="${params.estado}" 
                      class="form-select" id="estado" 
                    />
                    <label for="estado">Estado</label>
                  </div>
                </div>

                <!-- Botón colapsar filtros -->
                <div class="col-12 text-center mt-2">
                  <button 
                    class="btn btn-outline-secondary btn-sm" 
                    type="button" 
                    data-bs-toggle="collapse" 
                    data-bs-target="#filtrosAvanzados"
                  >
                    Ver más filtros
                  </button>
                </div>
              </div>

              <!-- Filtros avanzados -->
              <div class="collapse" id="filtrosAvanzados">
                <!-- Precio -->
                <div class="mb-3">
                  <h6 class="mb-2">💰 Precio (USD)</h6>
                  <div class="row g-3">
                    <div class="col-sm-6 col-md-4">
                      <div class="form-floating">
                        <g:textField 
                          name="minPrecio" value="${params.minPrecio}" 
                          class="form-control" id="minPrecio" 
                          placeholder="Mínimo" 
                        />
                        <label for="minPrecio">Mín. </label>
                      </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                      <div class="form-floating">
                        <g:textField 
                          name="maxPrecio" value="${params.maxPrecio}" 
                          class="form-control" id="maxPrecio" 
                          placeholder="Máximo" 
                        />
                        <label for="maxPrecio">Máx.</label>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- Metros cuadrados -->
                <div class="mb-4">
                  <h6 class="mb-2">📐 Metros cuadrados</h6>
                  <div class="row g-3">
                    <div class="col-sm-6 col-md-4">
                      <div class="form-floating">
                        <g:textField 
                          name="minMetros" value="${params.minMetros}" 
                          class="form-control" id="minMetros" 
                          placeholder="Mínimo" 
                        />
                        <label for="minMetros">Mín.</label>
                      </div>
                    </div>
                    <div class="col-sm-6 col-md-4">
                      <div class="form-floating">
                        <g:textField 
                          name="maxMetros" value="${params.maxMetros}" 
                          class="form-control" id="maxMetros" 
                          placeholder="Máximo" 
                        />
                        <label for="maxMetros">Máx.</label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Botones -->
              <div class="row g-3">
                <div class="col-sm-6 d-grid">
                  <g:submitButton 
                    name="Buscar" value="Buscar" 
                    class="btn btn-primary btn-lg" 
                  />
                </div>
                <div class="col-sm-6 d-grid">
                  <g:link 
                     action="index" 
                    class="btn btn-secondary btn-lg"
                  >
                    Limpiar filtros
                  </g:link>
                </div>
              </div>

            </g:form>
          </div>
        </div>
      </div>
    </div>
  </div>

<div class="properties-list">
  <g:each in="${properties}" var="propiedad">
    <div class="property-item">
      <div class="container-property-img">
        <a href="${createLink(controller:'propertiesList', action:'casa', id: propiedad.id)}">
          <img src="${propiedad.imagenes ? propiedad.imagenes[0].urlImagen : 'No hay imágenes'}" alt="${propiedad.titulo}" />
        </a>
        <span class="property-tag">
          <g:if test="${propiedad.estado == 'en venta'}">En Venta</g:if>
          <g:elseif test="${propiedad.estado == 'alquiler'}">En Renta</g:elseif>
          <g:elseif test="${propiedad.estado == 'reservado'}">Reservado</g:elseif>
          <g:elseif test="${propiedad.estado == 'vendida'}">Vendido</g:elseif>
          <g:else>Estado desconocido</g:else>
        </span>
        <div class="importante-casa">
          <h3 class="property-title">${propiedad.titulo}</h3>
          <p class="property-price">
            $${String.format('%,.2f', propiedad.precio)}
          </p>
        </div>

        <g:if test="${title != 'Details'}">
          <button class="save-button"
                  data-id="${propiedad.id}"
                  onclick="${title == 'Favoritos'
                    ? 'eliminarFavorito(event,' + propiedad.id + ')'
                    : 'saveFavorite(event,'  + propiedad.id + ')'}">
            <g:if test="${title == 'Favoritos'}">
              <span>Eliminar</span>
            </g:if>
            <g:else>
              <span><ion-icon name="heart"></ion-icon> Guardar</span>
            </g:else>
          </button>
        </g:if>
      </div>

      <div class="info-imagen">
        <div class="property-details">
          <ul>
            <li>
              <ion-icon name="bed"></ion-icon>
              <p>${propiedad.ciudad ?: 0} Habitaciones</p>
            </li>
            <li>
              <ion-icon name="crop"></ion-icon>
              <p>${propiedad.metrosCuadrados ?: 0} m²</p>
            </li>
          </ul>
        </div>
      </div>

      <g:if test="${title != 'Details'}">
        <button class="buy-button"
                onclick="comprarPropiedad(event)"
                data-id="${propiedad.id}">
          Comprar
        </button>
      </g:if>
    </div>
  </g:each>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
