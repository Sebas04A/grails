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
                    <g:select name="estado" id="estado" from="['En venta','alquiler','vendida']" value="${propiedadInstance?.estado}" class="form-control"/>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="usuario">Usuario</label>
                    <g:select name="usuario" id="usuario" from="${grailsantiguo.Usuario.list()}" optionKey="correo" optionValue="correo" value="${propiedadInstance?.usuario?.correo}" class="form-control" required="true"/>
                </div>
                <!-- PROPIEDAD HABITACIONAL -->
                <div class="col-12 mt-4">
                    <div class="card">
                        <div class="card-header bg-light">
                            <b>Detalles habitacionales (opcional)</b>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4 mb-2">
                                    <label for="numeroPisos"># Pisos</label>
                                    <input type="number" name="propiedadHabitacional.numeroPisos" id="numeroPisos" class="form-control"
                                           value="${propiedadInstance?.propiedadHabitacional?.numeroPisos ?: ''}" />
                                </div>
                                <div class="col-md-4 mb-2">
                                    <label for="numeroBalcones"># Balcones</label>
                                    <input type="number" name="propiedadHabitacional.numeroBalcones" id="numeroBalcones" class="form-control"
                                           value="${propiedadInstance?.propiedadHabitacional?.numeroBalcones ?: ''}" />
                                </div>
                                <div class="col-md-4 mb-2">
                                    <label for="numeroEstacionamientos"># Estacionamientos</label>
                                    <input type="number" name="propiedadHabitacional.numeroEstacionamientos" id="numeroEstacionamientos" class="form-control"
                                           value="${propiedadInstance?.propiedadHabitacional?.numeroEstacionamientos ?: ''}" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 mb-2">
                                    <label for="numeroMediosBanos"># Medios Baños</label>
                                    <input type="number" name="propiedadHabitacional.numeroMediosBanos" id="numeroMediosBanos" class="form-control"
                                           value="${propiedadInstance?.propiedadHabitacional?.numeroMediosBanos ?: ''}" />
                                </div>
                                <div class="col-md-4 mb-2">
                                    <label for="numeroBanos"># Baños Completos</label>
                                    <input type="number" name="propiedadHabitacional.numeroBanos" id="numeroBanos" class="form-control"
                                           value="${propiedadInstance?.propiedadHabitacional?.numeroBanos ?: ''}" />
                                </div>
                                <div class="col-md-4 mb-2">
                                    <label for="numeroHabitaciones"># Habitaciones</label>
                                    <input type="number" name="propiedadHabitacional.numeroHabitaciones" id="numeroHabitaciones" class="form-control"
                                           value="${propiedadInstance?.propiedadHabitacional?.numeroHabitaciones ?: ''}" />
                                </div>
                            </div>
                            <g:if test="${propiedadInstance?.propiedadHabitacional?.id}">
                                <g:hiddenField name="propiedadHabitacional.id"
                                               value="${propiedadInstance?.propiedadHabitacional?.id}"/>
                            </g:if>
                        </div>
                    </div>
                </div>
                <!-- FIN -->

                <!-- IMÁGENES -->
                <div class="col-12 mb-3 mt-4">
                    <label>Imágenes</label>
                    <g:if test="${imagenes && imagenes.size() > 0}">
                        <label>Imágenes actuales:</label>
                        <div class="d-flex flex-wrap gap-2 mb-3" id="imagenes-actuales">
                            <g:each in="${imagenes}" var="img" status="idx">
                                <div class="position-relative border rounded p-1 m-1" style="width:130px;">
                                    <img src="${img.urlImagen}" alt="Imagen" class="img-fluid" style="width:120px; height:90px; object-fit:cover; border-radius:6px;" />
                                    <div class="small text-muted mb-1">${img.descripcion ?: ''}</div>
                                    <!-- Botón Eliminar -->
                                    <button type="button" class="btn btn-sm btn-danger w-100 mt-1 btn-eliminar-imagen"
                                            data-id="${img.id}" onclick="eliminarImagenExistente(this, ${img.id})">
                                        <i class="bi bi-trash"></i> Eliminar
                                    </button>
                                    <!-- Hidden para saber qué imagenes ya existen -->
                                    <input type="hidden" name="imagenesExistentes[]" value="${img.id}" />
                                </div>
                            </g:each>
                        </div>
                    </g:if>

                    <div id="imagenes-container">
                        <!-- Se llenará dinámicamente -->
                    </div>
                    <button type="button" class="btn btn-secondary mb-2" onclick="agregarCampoImagen()">Agregar imagen</button>
                </div>
            </div>

            <div class="text-end mt-4">
                <!-- Botón Guardar eliminado para evitar duplicidad con el modal -->
            </div>
        </div>
    </g:form>
</g:else>

<script>
function agregarCampoImagen() {
    const container = document.getElementById("imagenes-container");
    const index = container.children.length;

    const div = document.createElement("div");
    div.classList.add("row", "mb-2");

    div.innerHTML = `
        <div class="col-md-6">
            <input type="text" name="imagenes[${index}].urlImagen" placeholder="URL de la imagen" class="form-control" required>
        </div>
        <div class="col-md-6">
            <input type="text" name="imagenes[${index}].descripcion" placeholder="Descripción" class="form-control">
        </div>
    `;
    container.appendChild(div);
}

// Eliminar visualmente la imagen existente y marcarla para eliminación
function eliminarImagenExistente(btn, idImagen) {
    // Quita la imagen de la vista
    btn.parentElement.remove();
    // Marca la imagen para eliminarla al guardar
    let input = document.createElement("input");
    input.type = "hidden";
    input.name = "imagenesAEliminar[]";
    input.value = idImagen;
    document.forms['frmPropiedad'].appendChild(input);
}
</script>

