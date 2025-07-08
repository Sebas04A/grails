<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Geografia</title>
    <asset:stylesheet src="Index.css"/>
</head>
<body>


<div id="hero">
    <div class="hero-content">
        <h1 id="titulo-interno">MiCasa<span>Hoy</span></h1>
        
            <g:form controller="propertiesList" action="buscarInicio" method="GET" class="search-bar">
            <div class="search-options">
                <input type="radio" id="venta" name="estado" value="en venta" class="search-radio" checked />
                <label for="venta" class="search-btn">Venta</label>

                <input type="radio" id="alquiler" name="estado" value="alquiler" class="search-radio" />
                <label for="alquiler" class="search-btn">Alquiler</label>
            </div>

            <div class="search-location">
                <select name="tipo" class="location-select">
                    <option value="casa">Casa</option>
                    <option value="departamento">Apartamento</option>
                    <option value="terreno">Terreno</option>
                    <option value="local">Local Comercial</option>
                </select>

                <g:textField
                    type="text"
                    name="q"
                    placeholder="¿Dónde? (e.j. Floresta)"
                    class="search-input"
                />

                <button type="submit" class="search-submit">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </g:form>
        
    </div>
</div>


</body>
</html>
