<div class="container mt-4">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0 text-white">Listado de Propiedades</h5>
        </div>
        <div class="card-body p-0">
            <table class="table table-bordered table-hover mb-0">
                <thead class="thead-light">
                    <tr>
                        <th style="width:20%">Título</th>
                        <th style="width:15%">Tipo</th>
                        <th style="width:15%">Precio</th>
                        <th style="width:20%">Dirección</th>
                        <th style="width:10%">Estado</th>
                        <th style="width:20%" class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <g:if test="${propiedades?.size() > 0}">
                    <g:each in="${propiedades}" var="propiedad">
                        <tr>
                            <td>${propiedad.titulo}</td>
                            <td>${propiedad.tipo}</td>
                            <td>$${propiedad.precio}</td>
                            <td>${propiedad.direccion}, ${propiedad.ciudad}</td>
                            <td>
                                <span class="badge badge-${propiedad.estado == 'Disponible' ? 'success' : 'secondary'}">
                                    ${propiedad.estado}
                                </span>
                            </td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-outline-info me-1 btn-show" data-id="${propiedad.id}" title="Ver">
                                    <i class="fa-solid fa-eye"></i>
                                </button>
                                <button class="btn btn-sm btn-outline-warning me-1 btn-edit" data-id="${propiedad.id}" title="Editar">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                </button>
                                <button class="btn btn-sm btn-outline-danger btn-borrar" data-id="${propiedad.id}" title="Eliminar">
                                    <i class="fa-solid fa-trash"></i>
                                </button>
                            </td>



                        </tr>
                    </g:each>
                </g:if>
                <g:else>
                    <tr>
                        <td colspan="6" class="text-center text-muted py-4">No se encontraron propiedades.</td>
                    </tr>
                </g:else>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  tooltipTriggerList.forEach(function (tooltipTriggerEl) {
    new bootstrap.Tooltip(tooltipTriggerEl)
  })
</script>


