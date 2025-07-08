<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Mis Favoritos - Bienes Raíces</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .favoritos-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            font-family: 'Arial', sans-serif;
        }
        
        .favoritos-header {
            background: var(--color-primario);
            color: white;
            padding: 40px 20px;
            text-align: center;
            border-radius: 15px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }
        
        .favoritos-header h1 {
            margin: 0;
            font-size: 2.5em;
            font-weight: 300;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }
        
        .favoritos-header .subtitle {
            font-size: 1.2em;
            margin-top: 10px;
            opacity: 0.9;
        }
        
        .favoritos-stats {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 30px 0;
        }
        
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            text-align: center;
            min-width: 120px;
        }
        
        .stat-number {
            font-size: 2em;
            font-weight: bold;
            color: #667eea;
        }
        
        .stat-label {
            color: #666;
            font-size: 0.9em;
            margin-top: 5px;
        }
        
        .favoritos-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }
        
        .favorito-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            position: relative;
        }
        
        .favorito-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }
        
        .favorito-image {
            width: 100%;
            height: 200px;
            background: linear-gradient(45deg, #f0f0f0, #e0e0e0);
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }
        
        .favorito-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        
        .favorito-card:hover .favorito-image img {
            transform: scale(1.05);
        }
        
        .favorito-image-placeholder {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #f0f0f0, #e0e0e0);
            color: #999;
            font-size: 3em;
        }
        
        .image-gallery-indicator {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(0,0,0,0.7);
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.8em;
            font-weight: bold;
        }
        
        .favorito-content {
            padding: 20px;
        }
        
        .favorito-title {
            font-size: 1.3em;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            line-height: 1.3;
        }
        
        .favorito-precio {
            font-size: 1.5em;
            font-weight: bold;
            color: #27ae60;
            margin-bottom: 10px;
        }
        
        .favorito-direccion {
            color: #666;
            font-size: 0.9em;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .favorito-direccion::before {
            content: '📍';
            font-size: 0.8em;
        }
        
        .favorito-tipo {
            display: inline-block;
            background: #667eea;
            color: white;
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.8em;
            margin-bottom: 15px;
            text-transform: uppercase;
            font-weight: bold;
        }
        
        .favorito-detalles {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid #eee;
        }
        
        .favorito-fecha {
            font-size: 0.8em;
            color: #999;
        }
        
        .btn-eliminar {
            background: linear-gradient(45deg, #ff6b6b, #ee5a52);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .btn-eliminar:hover {
            background: linear-gradient(45deg, #ee5a52, #ff6b6b);
            transform: scale(1.05);
        }
        
        .btn-eliminar::before {
            content: '🗑️';
            font-size: 0.9em;
        }
        
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .empty-state-icon {
            font-size: 4em;
            margin-bottom: 20px;
            opacity: 0.5;
        }
        
        .empty-state h3 {
            color: #666;
            margin-bottom: 10px;
        }
        
        .empty-state p {
            color: #999;
            margin-bottom: 20px;
        }
        
        .btn-explorar {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            text-decoration: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-weight: bold;
            transition: all 0.3s ease;
            display: inline-block;
        }
        
        .btn-explorar:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            color: white;
            text-decoration: none;
        }
        
        .flash-message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 10px;
            font-weight: bold;
        }
        
        .flash-message.success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .flash-message.error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        .favorito-habitacional {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
        }
        
        .habitacional-item {
            background: #f8f9fa;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 0.8em;
            color: #666;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        @media (max-width: 768px) {
            .favoritos-grid {
                grid-template-columns: 1fr;
            }
            
            .favoritos-header h1 {
                font-size: 2em;
            }
            
            .favoritos-stats {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <div class="favoritos-container">
        <div class="favoritos-header">
            <h1>💖 Mis Favoritos</h1>
            <p class="subtitle">Tus propiedades guardadas en un solo lugar</p>
        </div>
        
        <div class="favoritos-stats">
            <div class="stat-card">
                <div class="stat-number">${totalFavoritos}</div>
                <div class="stat-label">Favoritos</div>
            </div>
        </div>
        
        <!-- Mensajes flash -->
        <g:if test="${flash.success}">
            <div class="flash-message success">
                ${flash.success}
            </div>
        </g:if>
        
        <g:if test="${flash.error}">
            <div class="flash-message error">
                ${flash.error}
            </div>
        </g:if>
        
        <g:if test="${favoritos && favoritos.size() > 0}">
            <div class="favoritos-grid">
                <g:each in="${favoritos}" var="favorito">
                    <div class="favorito-card">
                        <div class="favorito-image">
                            <g:if test="${favorito.propiedad.imagenes && favorito.propiedad.imagenes.size() > 0}">
                                <img src="${favorito.propiedad.imagenes[0].urlImagen}" 
                                     alt="${favorito.propiedad.titulo}"
                                     onerror="this.parentElement.innerHTML='<div class=\'favorito-image-placeholder\'>🏠</div>'">
                                <g:if test="${favorito.propiedad.imagenes.size() > 1}">
                                    <div class="image-gallery-indicator">
                                        📷 ${favorito.propiedad.imagenes.size()}
                                    </div>
                                </g:if>
                            </g:if>
                            <g:else>
                                <div class="favorito-image-placeholder">🏠</div>
                            </g:else>
                        </div>
                        
                        <div class="favorito-content">
                            <h3 class="favorito-title">${favorito.propiedad.titulo}</h3>
                            
                            <div class="favorito-precio">
                                $<g:formatNumber number="${favorito.propiedad.precio}" type="currency" currencySymbol=""/>
                            </div>
                            
                            <div class="favorito-direccion">
                                ${favorito.propiedad.direccion}, ${favorito.propiedad.ciudad}
                            </div>
                            
                            <span class="favorito-tipo">${favorito.propiedad.tipo}</span>
                            
                            <p class="favorito-descripcion">
                                ${favorito.propiedad.descripcion?.take(120)}${favorito.propiedad.descripcion?.length() > 120 ? '...' : ''}
                            </p>
                            
                            <g:if test="${favorito.propiedad.propiedadHabitacional}">
                                <div class="favorito-habitacional">
                                    <g:if test="${favorito.propiedad.propiedadHabitacional.numeroHabitaciones}">
                                        <span class="habitacional-item">
                                            🛏️ ${favorito.propiedad.propiedadHabitacional.numeroHabitaciones} hab.
                                        </span>
                                    </g:if>
                                    <g:if test="${favorito.propiedad.propiedadHabitacional.numeroBanos}">
                                        <span class="habitacional-item">
                                            🚿 ${favorito.propiedad.propiedadHabitacional.numeroBanos} baños
                                        </span>
                                    </g:if>
                                    <g:if test="${favorito.propiedad.propiedadHabitacional.numeroEstacionamientos}">
                                        <span class="habitacional-item">
                                            🚗 ${favorito.propiedad.propiedadHabitacional.numeroEstacionamientos} estac.
                                        </span>
                                    </g:if>
                                </div>
                            </g:if>
                            
                            <div class="favorito-detalles">
                                <span class="favorito-fecha">
                                    Agregado el <g:formatDate date="${favorito.fechaAgregado}" format="dd/MM/yyyy"/>
                                </span>
                                
                                <g:form controller="favorito" action="eliminar" method="POST" class="form-eliminar-favorito d-inline">
                                    <g:hiddenField name="id" value="${favorito.id}"/>
                                    <button type="button" class="btn btn-outline-danger btn-sm btn-eliminar">
                                        <i class="bi bi-trash"></i> Eliminar
                                    </button>
                                </g:form>
                            </div>
                        </div>
                    </div>
                </g:each>
            </div>
        </g:if>
        <g:else>
            <div class="empty-state">
                <div class="empty-state-icon">💔</div>
                <h3>No tienes favoritos aún</h3>
                <p>Explora nuestras propiedades y guarda las que más te gusten</p>
                <g:link controller="propertiesList" action="index" class="btn-explorar">
                    Explorar Propiedades
                </g:link>
            </div>
        </g:else>
    </div>
<script>
    $(document).ready(function () {
    $('.btn-eliminar').click(function () {
        const $form = $(this).closest('form');

        bootbox.confirm({
            title: '<h5 class="text-danger"><i class="bi bi-exclamation-triangle-fill"></i> Confirmar eliminación</h5>',
            message: '¿Estás seguro de que quieres eliminar esta propiedad de tus favoritos?',
            buttons: {
                confirm: {
                    label: 'Sí, eliminar',
                    className: 'btn btn-danger btn-sm'
                },
                cancel: {
                    label: 'Cancelar',
                    className: 'btn btn-secondary btn-sm'
                }
            },
            callback: function (result) {
                if (result) {
                    $form.submit();
                }
            }
        });
    });
});
</script>
</body>
</html>