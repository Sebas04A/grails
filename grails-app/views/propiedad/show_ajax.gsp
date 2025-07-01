<%@ page import="grailsantiguo.Propiedad" %>

<g:if test="${!propiedadInstance}">
    <elm:notFound elem="Propiedad" genero="a"/>
</g:if>
<g:else>


    <div class="modal-body">
        <div class="container-fluid">

            <div class="row mb-2">
                <div class="col-sm-3 font-weight-bold">Título</div>
                <div class="col-sm-3">${propiedadInstance?.titulo}</div>
                <div class="col-sm-3 font-weight-bold">Tipo</div>
                <div class="col-sm-3 text-capitalize">${propiedadInstance?.tipo}</div>
            </div>

            <div class="row mb-2">
                <div class="col-sm-3 font-weight-bold">Descripción</div>
                <div class="col-sm-9">${propiedadInstance?.descripcion}</div>
            </div>

            <div class="row mb-2">
                <div class="col-sm-3 font-weight-bold">Precio</div>
                <div class="col-sm-3">${propiedadInstance?.precio}</div>
                <div class="col-sm-3 font-weight-bold">Metros²</div>
                <div class="col-sm-3">${propiedadInstance?.metrosCuadrados}</div>
            </div>

            <div class="row mb-2">
                <div class="col-sm-3 font-weight-bold">Dirección</div>
                <div class="col-sm-3">${propiedadInstance?.direccion}</div>
                <div class="col-sm-3 font-weight-bold">Ciudad</div>
                <div class="col-sm-3">${propiedadInstance?.ciudad}</div>
            </div>

            <div class="row mb-2">
                <div class="col-sm-3 font-weight-bold">Provincia</div>
                <div class="col-sm-3">${propiedadInstance?.provincia}</div>
                <div class="col-sm-3 font-weight-bold">País</div>
                <div class="col-sm-3">${propiedadInstance?.pais}</div>
            </div>

            <div class="row mb-2">
                <div class="col-sm-3 font-weight-bold">Estado</div>
                <div class="col-sm-3">${propiedadInstance?.estado == 'disponible' ? 'Disponible' : 'Vendida'}</div>
                <div class="col-sm-3 font-weight-bold">Fecha de creación</div>
                <div class="col-sm-3">
                    <g:formatDate date="${propiedadInstance?.fechaCreacion}" format="dd-MM-yyyy HH:mm"/>
                </div>
            </div>

            <div class="row mb-2">
                <div class="col-sm-3 font-weight-bold">Usuario</div>
                <div class="col-sm-9">${propiedadInstance?.usuario?.nombre}</div>
            </div>

        </div>
    </div>


</g:else>
