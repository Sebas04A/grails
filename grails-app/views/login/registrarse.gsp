<!DOCTYPE html>
<!-- saved from url=(0089)https://eva.puce.edu.ec/QUI-2025G/pluginfile.php/443439/mod_resource/content/1/inicio.gsp -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main">
    <title>Persona</title>
    <style>:is([id*='google_ads_iframe'],[id*='taboola-'],.taboolaHeight,.taboola-placeholder,#top-ad,#credential_picker_container,#credentials-picker-container,#credential_picker_iframe,[id*='google-one-tap-iframe'],#google-one-tap-popup-container,.google-one-tap__module,.google-one-tap-modal-div,#amp_floatingAdDiv,#ez-content-blocker-container) {display:none!important;min-height:0!important;height:0!important;}</style><style>
        .flipX video::-webkit-media-text-track-display {
            transform: matrix(-1, 0, 0, 1, 0, 0) !important;
        }
        .flipXY video::-webkit-media-text-track-display {
            transform: matrix(-1, 0, 0, -1, 0, 0) !important;
        }
        .flipXYX video::-webkit-media-text-track-display {
            transform: matrix(1, 0, 0, -1, 0, 0) !important;
        }</style><style>
        @keyframes blinkWarning {
            0% { color: red; }
            100% { color: white; }
        }
        @-webkit-keyframes blinkWarning {
            0% { color: red; }
            100% { color: white; }
        }
        .blinkWarning {
            -webkit-animation: blinkWarning 1s linear infinite;
            -moz-animation: blinkWarning 1s linear infinite;
            animation: blinkWarning 1s linear infinite;
        }</style><link rel="preconnect" href="https://fonts.googleapis.com/" crossorigin="use-credentials"><link rel="preconnect" href="https://fonts.gstatic.com/"><link rel="stylesheet" href="./Persona_files/css2"><style>undefined</style></head>
<body>
<h1>Registro de Personas</h1>
<g:if test="${flash.message}">
    <div class="alert alert-error" style="display: block; background-color: #fdd">
        ${flash.message}
    </div>
</g:if>

<g:form class="form-horizontal" name="frmPersona" role="form" controller="login" action="guardar" method="POST">
    <div class="row col-md-12">
        <div class="form-group col-2">
            <label for="nombre" class="col-form-label">nombre:</label>
        </div>
        <div class="form-group col-4">
            <input type="text" class="form-control" name="nombre" id="nombre">
        </div>
        <div class="form-group col-2">
            <label for="apellido" class="col-form-label">apellido:</label>
        </div>
        <div class="form-group col-4">
            <input type="text" class="form-control" name="apellido" id="apellido">
        </div>
    </div>
    <div class="row col-12">
        <div class="form-group col-md-1">
            <label for="sexo" class="col-form-label">Sexo:</label>
        </div>
        <div class="form-group col-1">
            <input type="text" class="form-control" name="sexo" id="sexo">
        </div>
        <div class="form-group col-md-2">
            <label for="login" class="col-form-label">Usuario:</label>
        </div>
        <div class="form-group col-3">
            <input type="text" class="form-control" name="login" id="login">
        </div>
        <div class="form-group col-md-2">
            <label for="password" class="col-form-label">Contraseña:</label>
        </div>
        <div class="form-group col-3">
            <input type="text" class="form-control" name="password" id="password">
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Aceptar</button>
    </div>
    %{----}%
</g:form>

</body></html>