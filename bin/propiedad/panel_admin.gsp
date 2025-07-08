<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Panel de Administración</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome para los iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    
    <meta name="layout" content="main">
   

</head>

<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow-lg border-0">
                    <div class="card-body text-center">
                        <h2 class="mb-4 text-primary fw-bold">Panel de Administración</h2>
                        <div class="row g-4">
                            <div class="col-12 col-md-6 mb-3 mb-md-0">
                                <a href="${createLink(controller:'propiedad', action:'list')}" class="btn btn-lg btn-outline-primary w-100 py-3 d-flex flex-column align-items-center shadow-sm">
                                    <i class="fa-solid fa-building-columns fa-2x mb-2 text-primary"></i>
                                    <span class="fs-5">Administrar propiedades</span>
                                </a>
                            </div>
                            <div class="col-12 col-md-6">
                                <a href="${createLink(controller:'propiedad', action:'administrar_usuarios')}" class="btn btn-lg btn-outline-success w-100 py-3 d-flex flex-column align-items-center shadow-sm">
                                    <i class="fa-solid fa-users-gear fa-2x mb-2 text-success"></i>
                                    <span class="fs-5">Administrar usuarios</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
