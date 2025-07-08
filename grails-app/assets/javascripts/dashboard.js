$(document).ready(function () {
    // --- Opciones de Colores y Estilo Global ---
    const chartColors = [
        '#008FFB',
        '#00E396',
        '#FEB019',
        '#FF4560',
        '#775DD0',
        '#546E7A',
        '#26a69a',
        '#D10CE8',
    ]
    const fontFamily = 'Helvetica, Arial, sans-serif'

    // --- 1. Gráfico de Barras: Propiedades por Tipo ---
    $.get('/api/dashboard/propiedadesPorTipo', function (response) {
        const options = {
            chart: { type: 'bar', height: 350, fontFamily: fontFamily },
            series: response.series,
            colors: [chartColors[0]],
            plotOptions: { bar: { borderRadius: 4, horizontal: false } },
            xaxis: { type: 'category' },
        }
        new ApexCharts(document.querySelector('#chartPropiedadesPorTipo'), options).render()
    })

    // --- 2. Histograma: Distribución de Precios ---
    $.get('/api/dashboard/distribucionPrecios', function (response) {
        const options = {
            chart: { type: 'bar', height: 350, fontFamily: fontFamily },
            series: response.series,
            colors: [chartColors[2]],
            plotOptions: { bar: { borderRadius: 4, horizontal: false } },
            xaxis: { type: 'category' },
        }
        new ApexCharts(document.querySelector('#chartDistribucionPrecios'), options).render()
    })

    // --- 3. Gráfico de Barras Horizontales: Top 10 Ciudades ---
    $.get('/api/dashboard/topCiudades', function (response) {
        const options = {
            chart: { type: 'bar', height: 350, fontFamily: fontFamily },
            series: response.series,
            colors: [chartColors[6]],
            plotOptions: { bar: { borderRadius: 4, horizontal: true } },
            xaxis: { type: 'category' },
        }
        new ApexCharts(document.querySelector('#chartTopCiudades'), options).render()
    })

    // --- 4. Gráfico de Barras: Las 10 Propiedades con más Favoritos ---
    $.get('/api/dashboard/topFavoritos', function (response) {
        const options = {
            chart: { type: 'bar', height: 350, fontFamily: fontFamily },
            series: response.series,
            colors: [chartColors[3]],
            plotOptions: { bar: { borderRadius: 4, horizontal: false } },
            xaxis: { type: 'category', labels: { rotate: -45, trim: true } },
            tooltip: { x: { show: true } },
        }
        new ApexCharts(document.querySelector('#chartTopFavoritos'), options).render()
    })

    // --- 5. Diagrama de Dispersión: Relación Precio vs. Metros Cuadrados ---
    $.get('/api/dashboard/precioVsMetros', function (response) {
        const options = {
            chart: {
                type: 'scatter',
                height: 350,
                zoom: { enabled: true, type: 'xy' },
                fontFamily: fontFamily,
            },
            series: response.series,
            colors: [chartColors[4]],
            xaxis: {
                tickAmount: 10,
                title: { text: 'Metros Cuadrados (m²)' },
                labels: {
                    formatter: val => {
                        return parseFloat(val).toFixed(0)
                    },
                },
            },
            yaxis: {
                tickAmount: 7,
                title: { text: 'Precio' },
            },
        }
        new ApexCharts(document.querySelector('#chartPrecioVsMetros'), options).render()
    })

    // --- 6. Gráfico de Líneas: Evolución de Favoritos Agregados por Día/Mes ---
    $.get('/api/dashboard/evolucionFavoritos', function (response) {
        const options = {
            chart: { type: 'area', height: 350, fontFamily: fontFamily },
            series: response.series,
            colors: [chartColors[1]],
            stroke: { curve: 'smooth' },
            xaxis: { type: 'category' },
            dataLabels: { enabled: false },
        }
        new ApexCharts(document.querySelector('#chartEvolucionFavoritos'), options).render()
    })
})
