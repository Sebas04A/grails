<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main"/>
    
    <title>Dashboard Inmobiliario</title>
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .chart-card {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            padding: 24px;
            margin-bottom: 24px;
            height: 100%;
        }
        .chart-card-header h5 {
            color: #495057;
            font-weight: 600;
        }
        .apexcharts-toolbar {
            z-index: 1 !important;
        }
    </style>
</head>
<body>

<div class="container-fluid p-4">
    <h1 class="h2 mb-4">Dashboard MiCasaHoy</h1>

    <div class="row">
        <div class="col-xl-4 col-lg-6">
            <div class="chart-card">
                <div class="chart-card-header">
                    <h5>Propiedades por Tipo</h5>
                </div>
                <div id="chartPropiedadesPorTipo"></div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-6">
            <div class="chart-card">
                <div class="chart-card-header">
                    <h5>Distribución de Precios</h5>
                </div>
                <div id="chartDistribucionPrecios"></div>
            </div>
        </div>
        <div class="col-xl-4 col-lg-12">
            <div class="chart-card">
                <div class="chart-card-header">
                    <h5>Top 10 Propiedades con más Favoritos</h5>
                </div>
                <div id="chartTopFavoritos"></div>
            </div>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-lg-6">
            <div class="chart-card">
                <div class="chart-card-header">
                    <h5>Evolución de Favoritos (Mensual)</h5>
                </div>
                <div id="chartEvolucionFavoritos"></div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="chart-card">
                 <div class="chart-card-header">
                    <h5>Precio vs. Metros Cuadrados</h5>
                </div>
                <div id="chartPrecioVsMetros"></div>
            </div>
        </div>
    </div>
    
    <div class="row mt-2">
         <div class="col-12">
            <div class="chart-card">
                 <div class="chart-card-header">
                    <h5>Top 10 Ciudades con más Propiedades</h5>
                </div>
                <div id="chartTopCiudades"></div>
            </div>
        </div>
    </div>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<asset:javascript src="dashboard.js"/>

</body>
</html>