<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Estadísticas</title>
    <style>
        table {
            width: 80%; margin: 1em auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc; padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        h2 {
            text-align: center;
            margin-top: 2em;
        }
    </style>
</head>
<body>
<h1 style="text-align: center;">📈 Estadísticas Generales</h1>

<h2>Usuarios por Rol</h2>
<table>
    <tr><th>Rol</th><th>Cantidad</th></tr>
    <g:each in="${usuariosPorRol}" var="entry">
        <tr><td>${entry[0]}</td><td>${entry[1]}</td></tr>
    </g:each>
</table>

<h2>Propiedades por Estado</h2>
<table>
    <tr><th>Estado</th><th>Cantidad</th></tr>
    <g:each in="${propiedadesPorEstado}" var="entry">
        <tr><td>${entry[0]}</td><td>${entry[1]}</td></tr>
    </g:each>
</table>

<h2>Top 5 Ciudades con Más Propiedades</h2>
<table>
    <tr><th>Ciudad</th><th>Cantidad</th></tr>
    <g:each in="${ciudadesConMasPropiedades}" var="entry">
        <tr><td>${entry[0]}</td><td>${entry[1]}</td></tr>
    </g:each>
</table>

<h2>Promedio de Precio por Tipo</h2>
<table>
    <tr><th>Tipo</th><th>Promedio (USD)</th></tr>
    <g:each in="${promedioPrecioPorTipo}" var="entry">
        <tr><td>${entry[0]}</td><td>${entry[1] != null ? new BigDecimal(entry[1]).setScale(2, BigDecimal.ROUND_HALF_UP) : ''}</td>
</tr>
    </g:each>
</table>

<h2>Top 5 Propiedades Más Favoritas</h2>
<table>
    <tr><th>Propiedad</th><th>Favoritos</th></tr>
    <g:each in="${topFavoritos}" var="entry">
        <tr><td>${entry[0]}</td><td>${entry[1]}</td></tr>
    </g:each>
</table>
</body>
</html>
