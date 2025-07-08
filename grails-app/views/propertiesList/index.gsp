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
<div >
    <div class="d-flex justify-content-center">
     
        <div class="card shadow-sm">
          <div class="card-body p-sm-5">
            <h4 class="card-title text-center mb-4">🔍 Buscar propiedades</h4>

            <g:form method="get" controller="propertiesList" action="index">
              
              <!-- Búsqueda general -->
              <div class="d-flex flex-wrap justify-content-center g-3 mb-5">
                <div class="col-12 m-4">
                  <div class="">
                  <label for="buscarGeneral">
                      Título, ciudad, provincia…
                    </label>
                    <g:textField 
                      name="q" value="${params.q}" 
                      class="form-control" id="buscarGeneral" 
                      placeholder="Buscar..." 
                    />
                    
                  </div>
                </div>

                <!-- Tipo / Estado -->
                <div class="col-6 text-center">
                  
                  <label for="tipo">Tipo</label>
                    <g:select 
                      name="tipo" from="${['','casa','departamento','terreno','local']}"
                      value="${params.tipo}" 
                      class="form-select" id="tipo" 
                    />
                    
                  
                </div>
                <div class="col-6 text-center">
                  
                  <label for="estado">Estado</label>
                    <g:select 
                      name="estado" from="${['','en venta','alquiler','vendida']}"
                      value="${params.estado}" 
                      class="form-select" id="estado" 
                    />
                    
                  
                </div>

              </div>
              <div class="w-100">
              <!-- Botón colapsar filtros -->
                <div class="text-center mt-2">
                  <button 
                    class="btn btn-outline-secondary btn-sm btn-ver-mas-filtros" 
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
              <div class="d-flex g-3 mt-4 justify-content-around align-items-center bg-light p-3 rounded">
              
                
                  <div class=w-ful>
                    <g:submitButton 
                      name="Buscar" value="Buscar" 
                      class="btn btn-primary btn-lg" 
                    />
                  </div>
                  <div class="">
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




<div class="container mt-5">
    <h4 class="mb-4">Resultados de Búsqueda</h4>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
    <div class="properties-list">
        <g:each var="propiedad" in="${properties}" >
            
  
    <div class="property-item">
      <div class="container-property-img">
        <a href="${createLink(controller:'propertiesList', action:'casa', id: propiedad.id)}">
          <img src="${propiedad.imagenes ? propiedad.imagenes[0].urlImagen : 'No hay imágenes'}" alt="${propiedad.titulo}" />
        </a>
        <span class="property-tag">
          <g:if test="${propiedad.estado == 'En venta'}">En Venta</g:if>
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
          <g:set var="esFavorito" value="${favoritos.contains(propiedad.id)}" />
          <button class="save-button ${esFavorito ? 'favorito-activo' : ''}"
                  data-id="${propiedad.id}"
                  onclick="toggleFavorito(${propiedad.id}, this)">
            <g:if test="${esFavorito}">
              <span><ion-icon name="heart"></ion-icon> En Favoritos</span>
            </g:if>
            <g:else>
              <span><ion-icon name="heart-outline"></ion-icon> Guardar</span>
            </g:else>
          </button>
        </g:if>
      </div>

      <div class="info-imagen">
        <div class="property-details">
          <ul>
            <li>
              <ion-icon name="bed"></ion-icon>
              <p>${propiedad.ciudad ?: 0}</p>
            </li>
            <li>
              <ion-icon name="crop"></ion-icon>
              <p>${propiedad.metrosCuadrados ?: 0} m²</p>
            </li>
          </ul>
        </div>
      </div>

      <g:if test="${title != 'Details'}">
    <button type="button"
            class="buy-button contact-property-btn" data-property-id="${propiedad.id}">
        Contactar
    </button>
</g:if>
    </div>
  
        </g:each>
</div>
        
    </div>

    
</div>

<div class="modal fade" id="contactModal" tabindex="-1" aria-labelledby="contactModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="contactModalLabel">Contactar por Propiedad</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="contactName" class="form-label">Tu Nombre</label>
                        <input type="text" class="form-control" id="contactName" required>
                    </div>
                    <div class="mb-3">
                        <label for="contactEmail" class="form-label">Tu Email</label>
                        <input type="email" class="form-control" id="contactEmail" required>
                    </div>
                    <div class="mb-3">
                        <label for="contactMessage" class="form-label">Mensaje</label>
                        <textarea class="form-control" id="contactMessage" rows="4">Estoy interesado en esta propiedad y me gustaría obtener más información.</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Enviar Mensaje</button>
                    
                </form>
            </div>
        </div>
    </div>
</div>



<script>
$(document).ready(function() {

    // 1. Escucha el evento 'click' en los botones con la clase 'contact-property-btn'
    $('.contact-property-btn').on('click', function() {
        var propertyId = $(this).data('propertyId'); // Obtiene el valor del atributo data-property-id

        // 2. Establece el ID de la propiedad en el campo oculto del modal
        $('#contactModal #propertyIdInput').val(propertyId);

        console.log('Botón "Contactar" clickeado. ID de Propiedad:', propertyId);

        // 3. Obtén la referencia al elemento DOM del modal
        var myModalEl = document.getElementById('contactModal');

        // 4. Crea una nueva instancia del modal de Bootstrap
        // Esto es crucial para manejar el modal programáticamente en Bootstrap 5+
        var myModal = new bootstrap.Modal(myModalEl);

        // 5. Muestra el modal
        myModal.show();
    });

    // Opcional: Limpiar el formulario del modal cuando se cierre
    $('#contactModal').on('hidden.bs.modal', function () {
        $(this).find('form')[0].reset(); // Resetea el formulario
        $('#contactModal #propertyIdInput').val(''); // También limpia el campo oculto
        console.log('Modal de contacto cerrado y formulario reseteado.');
    });

});
$(document).ready(function () {
    $('.btn-ver-mas-filtros').click(function () {
        $('#filtrosAvanzados').collapse('toggle');
    });
});


function toggleFavorito(propiedadId, buttonElement) {
    const originalContent = buttonElement.innerHTML;
    buttonElement.innerHTML = '<span>⏳ Procesando...</span>';
    buttonElement.disabled = true;
    
    // Hacer petición AJAX
    
    $.ajax({
    url: '${createLink(controller: "favorito", action: "toggle")}',
    method: 'POST',
    data: {
        propiedadId: propiedadId
    },
    beforeSend: function() {
        buttonElement.disabled = true;
    },
    success: function(data, textStatus, jqXHR) {
        console.log('Respuesta del servidor:', data);
        if (data.success) {
            if (data.action === 'added') {
                buttonElement.innerHTML = '<span><ion-icon name="heart"></ion-icon> En Favoritos</span>';
                buttonElement.classList.add('favorito-activo');
                showMessage('Agregado a favoritos', 'success');
            } else if (data.action === 'removed') {
                buttonElement.innerHTML = '<span><ion-icon name="heart-outline"></ion-icon> Guardar</span>';
                buttonElement.classList.remove('favorito-activo');
                showMessage('Eliminado de favoritos', 'info');
            }
        } else {
            console.error('Error al procesar favorito:', data);
            showMessage(data.message || 'Error al procesar favorito', 'error');
            buttonElement.innerHTML = originalContent;
        }
    },
    error: function(jqXHR, textStatus, errorThrown) {
        console.error('Error:', errorThrown);
        showMessage('Error de conexión', 'error');
        buttonElement.innerHTML = originalContent;
    },
    complete: function() {
        buttonElement.disabled = false;
    }
});

}

// Función para mostrar mensajes
function showMessage(message, type = 'info') {
    const config = {
        success: { title: '¡Éxito!', icon: '✅', class: 'text-success' },
        error: { title: 'Error', icon: '❌', class: 'text-danger' },
        info: { title: 'Información', icon: 'ℹ️', class: 'text-info' },
        warning: { title: 'Advertencia', icon: '⚠️', class: 'text-warning' }
    };

    const settings = config[type] || config.info;

    bootbox.alert({
        title: '<h5 class="' + settings.class + '">' + settings.icon + ' ' + settings.title + '</h5>',
        message: '<div class="fs-6">' + message + '</div>',
        centerVertical: true,
        buttons: {
            ok: {
                label: 'Cerrar',
                className: 'btn btn-sm btn-primary'
            }
        }
    });
}



// Función para comprar (tu función existente)
function comprarPropiedad(event) {
    event.preventDefault();
    // Tu lógica de compra aquí
    console.log("Comprar propiedad:", event.target.dataset.id);
}

// Funciones de compatibilidad (opcional, para mantener código existente)
function saveFavorite(event, propiedadId) {
    event.preventDefault();
    const button = event.target.closest('button');
    toggleFavorito(propiedadId, button);
}

function eliminarFavorito(event, propiedadId) {
    event.preventDefault();
    const button = event.target.closest('button');
    toggleFavorito(propiedadId, button);
}
</script>

</body>
</html>
