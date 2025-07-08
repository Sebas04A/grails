<!DOCTYPE html>
<html>
<head>
    <%-- Asume que tienes un layout principal llamado 'main.gsp'. Si no, puedes quitar esta línea. --%>
    <meta name="layout" content="main"/>
    <title>Mis Propiedades Favoritas</title>
    
    <%-- Usamos Bootstrap 4 para un diseño moderno y responsivo. --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <%-- Usamos FontAwesome para los iconos. --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

    <style>
        /* Estilos personalizados para un look más elegante */
        body {
            background-color: #f8f9fa;
        }

        .page-header {
            padding: 4rem 1rem;
            margin-bottom: 3rem;
            background: linear-gradient(45deg, #007bff, #6f42c1);
            color: white;
            text-align: center;
            border-radius: 0 0 30px 30px;
        }

        .page-header h1 {
            font-weight: 700;
            letter-spacing: 1px;
        }

        .favorite-card {
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
            border: none;
            border-radius: 15px;
            overflow: hidden;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.07);
        }

        .favorite-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(0,0,0,0.12);
        }

        .card-img-container {
            position: relative;
            height: 250px;
            overflow: hidden;
        }

        .card-img-top {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .card-price {
            font-size: 1.6rem;
            font-weight: 700;
            color: #007bff;
        }

        .card-location {
            color: #6c757d;
            font-weight: 500;
        }
        
        .btn-delete {
            background-color: #e74c3c;
            border-color: #e74c3c;
            font-weight: bold;
            transition: all 0.2s;
        }
        .btn-delete:hover {
            background-color: #c0392b;
            border-color: #c0392b;
            transform: scale(1.05);
        }

        .empty-favorites {
            text-align: center;
            padding: 5rem 2rem;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>
    <div class="page-header">
        <div class="container">
            <h1>Mis Favoritos</h1>
            <p class="lead">Las propiedades que más te han gustado, en un solo lugar.</p>
        </div>
    </div>

    <div class="container my-4">

        <%-- Bloque para mostrar mensajes de éxito o error (flash scope) --%>
        <g:if test="${flash.success}">
            <div class="alert alert-success" role="alert">${flash.success}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger" role="alert">${flash.error}</div>
        </g:if>

        <%-- Si la lista de favoritos está vacía, mostramos un mensaje amigable --%>
        <g:if test="${!favoritos}">
            <div class="empty-favorites">
                <i class="far fa-heart fa-4x text-muted mb-3"></i>
                <h2>Aún no tienes favoritos</h2>
                <p class="text-muted">Explora nuestro catálogo y guarda las propiedades que te interesen.</p>
                <g:link controller="propiedad" action="index" class="btn btn-primary btn-lg mt-3">
                    <i class="fas fa-search"></i> Ver Propiedades
                </g:link>
            </div>
        </g:if>
        <g:else>
            <div class="row">
                <%-- Iteramos sobre cada favorito para mostrarlo en una tarjeta --%>
                <g:each in="${favoritos}" var="favorito">
                    <div class="col-lg-4 col-md-6">
                        <div class="card favorite-card">
                            <g:set var="propiedad" value="${favorito.propiedad}" />
                            
                            <div class="card-img-container">
                                <%-- Lógica para mostrar la primera imagen o un placeholder --%>
                                <g:if test="${propiedad.imagenes}">
                                    <%-- CORRECCIÓN: Usamos la URL directamente desde la clase de dominio --%>
                                    <img src="${propiedad.imagenes.first().urlImagen}" class="card-img-top" alt="Imagen de ${propiedad.titulo.encodeAsHTML()}">
                                </g:if>
                                <g:else>
                                    <%-- Imagen de reemplazo si la propiedad no tiene fotos --%>
                                    <img src="https://placehold.co/600x400/6f42c1/FFFFFF?text=Propiedad" class="card-img-top" alt="Imagen no disponible">
                                </g:else>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">
                                    <g:link controller="propiedad" action="show" id="${propiedad.id}">
                                        ${propiedad.titulo.encodeAsHTML()}
                                    </g:link>
                                </h5>
                                <p class="card-price">
                                    <g:formatNumber number="${propiedad.precio}" type="currency" currencyCode="USD" />
                                </p>
                                <p class="card-location">
                                    <i class="fas fa-map-marker-alt"></i>
                                    ${propiedad.ciudad.encodeAsHTML()}, ${propiedad.provincia.encodeAsHTML()}
                                </p>
                                <p class="card-text">
                                    <small class="text-muted">Agregado el <g:formatDate date="${favorito.fechaAgregado}" format="dd/MM/yyyy" /></small>
                                </p>

                                <%-- El botón de eliminar es un formulario para usar el método POST --%>
                                <g:form controller="favorito" action="eliminar" id="${favorito.id}" method="POST" class="mt-3">
                                    <button type="submit" class="btn btn-danger btn-block btn-delete" 
                                            onclick="return confirm('¿Estás seguro de que quieres eliminar esta propiedad de tus favoritos?');">
                                        <i class="fas fa-trash-alt"></i> Eliminar de Favoritos
                                    </button>
                                </g:form>
                            </div>
                        </div>
                    </div>
                </g:each>
            </div>
        </g:else>
    </div>
</body>
</html>