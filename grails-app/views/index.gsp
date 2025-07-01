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
        <div class="search-bar">
            <div class="search-options">
                <input type="radio" id="venta" name="option" class="search-radio" checked />
                <label for="venta" class="search-btn">Venta</label>

                <input type="radio" id="alquiler" name="option" class="search-radio" />
                <label for="alquiler" class="search-btn">Alquiler</label>
            </div>
            <div class="search-location">
                <select class="location-select">
                    <option value="global">Casa</option>
                    <option value="local">Apartamento</option>
                </select>
                <input
                        type="text"
                        placeholder="¿Dónde? (e.j. Floresta)"
                        class="search-input"
                />
                <button class="search-submit">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </div>
</div>

<main>
    <section class="featured-properties">
        <h2>Propiedades Destacadas</h2>
        <div class="properties-list">
            <div class="property-item">
                <img src="images/casa1.jpg" alt="Casa 1" />
                <h3>Casa Moderna en la Ciudad</h3>
                <p>Precio: $500,000</p>
            </div>
            <div class="property-item">
                <img src="images/casa2.jpg" alt="Casa 2" />
                <h3>Casa de Campo en las Montañas</h3>
                <p>Precio: $350,000</p>
            </div>
            <div class="property-item">
                <img src="images/casa3.jpg" alt="Casa 3" />
                <h3>Apartamento con Vista al Mar</h3>
                <p>Precio: $600,000</p>
            </div>
        </div>
    </section>
</main>
<script >
    document.querySelector('.search-submit').addEventListener('click', function() {
       location.href = '/propiedad/list';
    });
</script>
</body>
</html>
