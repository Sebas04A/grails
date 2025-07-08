<table class="table table-bordered table-hover mb-0 align-middle">
    <thead class="table-light">
        <tr>
            <th style="width:5%">#</th>
            <th style="width:18%">Nombre</th>
            <th style="width:18%">Apellido</th>
            <th style="width:25%">Correo</th>
            <th style="width:10%">Rol</th>
            <th style="width:15%">Fecha Registro</th>
            <th style="width:9%" class="text-center">Acciones</th>
        </tr>
    </thead>
    <tbody>
        <g:if test="${usuarios?.size() > 0}">
            <g:each in="${usuarios}" var="u" status="i">
                <tr>
                    <td>${i + 1}</td>
                    <td>${u.nombre}</td>
                    <td>${u.apellido}</td>
                    <td>${u.correo}</td>
                    <td>
                        <span class="badge badge-${u.rol == 'admin' ? 'primary' : 'secondary'} text-capitalize">
                            <i class="fa fa-${u.rol == 'admin' ? 'user-shield' : 'user'} me-1"></i>
                            ${u.rol}
                        </span>
                    </td>
                    <td>
                        <g:formatDate date="${u.fechaRegistro}" format="dd-MM-yyyy"/>
                    </td>
                    <td class="text-center">
                        <button class="btn btn-sm btn-outline-info me-1 btn-show-usuario" data-id="${u.id}" title="Ver">
                            <i class="fa fa-eye"></i>
                        </button>
                        <button class="btn btn-sm btn-outline-warning me-1 btn-edit-usuario" data-id="${u.id}" title="Editar">
                            <i class="fa fa-pencil-alt"></i>
                        </button>
                        <button class="btn btn-sm btn-outline-danger btn-borrar-usuario" data-id="${u.id}" title="Eliminar">
                            <i class="fa fa-trash"></i>
                        </button>
                    </td>
                </tr>
            </g:each>
        </g:if>
        <g:else>
            <tr>
                <td colspan="7" class="text-center text-muted py-4">
                    <i class="fa fa-users fa-2x mb-2"></i><br>
                    No se encontraron usuarios registrados.
                </td>
            </tr>
        </g:else>
    </tbody>
</table>
