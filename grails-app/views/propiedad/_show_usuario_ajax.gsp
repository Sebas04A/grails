<g:if test="${usuario}">
    <div class="container-fluid">
        <div class="row mb-3">
            <div class="col-md-4 fw-bold">Nombre</div>
            <div class="col-md-8">${usuario?.nombre}</div>
        </div>
        <div class="row mb-3">
            <div class="col-md-4 fw-bold">Apellido</div>
            <div class="col-md-8">${usuario?.apellido}</div>
        </div>
        <div class="row mb-3">
            <div class="col-md-4 fw-bold">Correo</div>
            <div class="col-md-8">${usuario?.correo}</div>
        </div>
        <div class="row mb-3">
            <div class="col-md-4 fw-bold">Rol</div>
            <div class="col-md-8">
                <span class="badge badge-${usuario.rol == 'admin' ? 'primary' : 'secondary'} text-capitalize">
                    <i class="fa fa-${usuario.rol == 'admin' ? 'user-shield' : 'user'} me-1"></i>
                    ${usuario.rol}
                </span>
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-4 fw-bold">Fecha de registro</div>
            <div class="col-md-8">
                <g:formatDate date="${usuario?.fechaRegistro}" format="dd-MM-yyyy"/>
            </div>
        </div>
    </div>
</g:if>
<g:else>
    <div class="alert alert-danger">Usuario no encontrado.</div>
</g:else>