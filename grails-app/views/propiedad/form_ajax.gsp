<g:if test="${!propiedadInstance}">
    <elm:notFound elem="Propiedad" genero="o"/>
</g:if>
<g:else>
    <g:form name="frmPropiedad" action="save_ajax" method="POST" class="w-100">
        <g:hiddenField name="id" value="${propiedadInstance?.id}"/>

        <div class="container-fluid">
            <div class="row">

                <div class="col-md-6 mb-3">
                    <label for="titulo">Título</label>
                    <g:textField name="titulo" id="tituloform" class="form-control" value="${propiedadInstance?.titulo}"/>
                </div>

                <div class="col-md-6 mb-3">
                    <label for="tipo">Tipo</label>
                    <g:select name="tipo" id="tipo" from="['casa','departamento','terreno','local']" value="${propiedadInstance?.tipo}" class="form-control"/>
                </div>

                <div class="col-12 mb-3">
                    <label for="descripcion">Descripción</label>
                    <g:textArea name="descripcion" id="descripcion" class="form-control" rows="3">${propiedadInstance?.descripcion}</g:textArea>
                </div>

                <div class="col-md-6 mb-3">
                    <label for="precio">Precio</label>
                    <g:textField name="precio" id="precio" value="${propiedadInstance?.precio}" class="form-control"/>
                </div>

                <div class="col-md-6 mb-3">
                    <label for="direccion">Dirección</label>
                    <g:textField name="direccion" id="direccion" value="${propiedadInstance?.direccion}" class="form-control"/>
                </div>

                <div class="col-md-4 mb-3">
                    <label for="ciudad">Ciudad</label>
                    <g:textField name="ciudad" id="ciudad" value="${propiedadInstance?.ciudad}" class="form-control"/>
                </div>

                <div class="col-md-4 mb-3">
                    <label for="provincia">Provincia</label>
                    <g:textField name="provincia" id="provincia" value="${propiedadInstance?.provincia}" class="form-control"/>
                </div>

                <div class="col-md-4 mb-3">
                    <label for="pais">País</label>
                    <g:textField name="pais" id="pais" value="${propiedadInstance?.pais}" class="form-control"/>
                </div>

                <div class="col-md-6 mb-3">
                    <label for="metrosCuadrados">Metros Cuadrados</label>
                    <g:textField name="metrosCuadrados" id="metrosCuadrados" value="${propiedadInstance?.metrosCuadrados}" class="form-control"/>
                </div>

                <div class="col-md-6 mb-3">
                    <label for="estado">Estado</label>
                    <g:select name="estado" id="estado" from="['disponible','vendida']" value="${propiedadInstance?.estado}" class="form-control"/>
                </div>

            </div>
        </div>
    </g:form>
</g:else>
