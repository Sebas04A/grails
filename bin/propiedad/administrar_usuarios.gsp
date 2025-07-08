<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Usuarios</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
</head>
<body>
<div class="container mt-4">

    <!-- ENCABEZADO Y ACCIONES -->
    <div class="card shadow-sm mb-4">
        <div class="card-body d-flex justify-content-between align-items-center">
            <h5 class="mb-0"><i class="fa fa-users me-2"></i>Gestión de Usuarios</h5>
            <div>
                <a href="#" class="btn btn-success btnCrearUsuario">
                    <i class="fa fa-plus me-1"></i> Nuevo Usuario
                </a>
            </div>
        </div>
    </div>

    <!-- FILTRO DE BÚSQUEDA -->
    <div class="card shadow-sm border-0 mb-4">
        <div class="card-body bg-light rounded d-flex align-items-center">
            <input
                type="text"
                class="form-control form-control-lg rounded-pill border-0 flex-grow-1 me-3"
                id="criterioUsuario"
                placeholder="Buscar usuario por nombre, correo, rol..."
            />
            <button
                type="button"
                class="btn btn-lg btn-primary rounded-pill px-4"
                id="btnBuscarUsuario"
            >
                <i class="fa fa-search me-2"></i> Buscar
            </button>
        </div>
    </div>

    <!-- TABLA DE RESULTADOS -->
    <div class="card shadow-sm">
        <div class="card-body p-0">
            <div id="tabla_usuarios_ajax" class="table-responsive">
                <!-- Aquí se carga dinámicamente la tabla -->
            </div>
        </div>
    </div>

</div>

<script>
    // Buscar usuarios AJAX
    $("#btnBuscarUsuario").click(function () {
        var criterio = $("#criterioUsuario").val();
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'propiedad', action:'buscar_usuarios_ajax')}",
            data: {criterio: criterio},
            success: function (msg) {
                $("#tabla_usuarios_ajax").html(msg)
            }
        });
    });
    $("#criterioUsuario").keypress(function (e) {
        if (e.keyCode === 13) {
            e.preventDefault();
            $("#btnBuscarUsuario").click();
        }
    });

    // Modales para ver, editar, eliminar usuario
    function mostrarUsuario(id) {
        var title = "Ver Usuario";
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'propiedad', action:'show_usuario_ajax')}",
            data: {id: id},
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title,
                    message: msg,
                    class: "modal-lg",
                    buttons: {
                        aceptar: {
                            label: "Aceptar",
                            className: "btn-primary"
                        }
                    }
                });
            }
        });
    }

    function deleteUsuario(id) {
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>¿Está seguro que desea eliminar este usuario?</p>",
            closeButton: false,
            buttons: {
                cancelar: {
                    label: "Cancelar",
                    className: "btn-primary"
                },
                eliminar: {
                    label: "<i class='fa fa-trash'></i> Eliminar",
                    className: "btn-danger",
                    callback: function () {
                        $.ajax({
                            type: "POST",
                            url: '${createLink(controller: 'propiedad', action:'delete_usuario_ajax')}',
                            data: {id: id},
                            success: function (msg) {
                                if (msg == 'ok') {
                                    setTimeout(function () {
                                        location.reload();
                                    }, 300);
                                } else {
                                    alert("Error al borrar el usuario");
                                }
                            }
                        });
                    }
                }
            }
        });
    }

    function createEditUsuario(id) {
        var title = id ? "Editar Usuario" : "Nuevo Usuario";
        var data = id ? {id: id} : {};

        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'propiedad', action: 'form_usuario_ajax')}",
            data: data,
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title,
                    message: msg,
                    class: "modal-completo",
                    buttons: {
                        cancelar: {
                            label: "Cancelar",
                            className: "btn-secondary"
                        },
                        guardar: {
                            label: "Guardar",
                            className: "btn-success",
                            callback: function () {
                                return submitUsuarioForm();
                            }
                        }
                    }
                });
            }
        });
    }

    function submitUsuarioForm() {
        console.log("Submitting user form...");
    var $form = $("#frmUsuario");
    $.ajax({
        type: "POST",
        url: $form.attr("action"),
        data: $form.serialize(),
        success: function (msg) {
            if (msg === 'ok') {
                setTimeout(function () { location.reload(); }, 500);
            } else {
                alert("Error al guardar el usuario.\n" + msg);
            }
        }
    });
    return false;
    }

    // Eventos
    $(document).on("click", ".btn-edit-usuario", function () {
        var id = $(this).data("id");
        createEditUsuario(id);
    });

    $(document).on("click", ".btn-borrar-usuario", function () {
        var id = $(this).data("id");
        deleteUsuario(id);
    });

    $(document).on("click", ".btn-show-usuario", function () {
        var id = $(this).data("id");
        mostrarUsuario(id);
    });

    $(".btnCrearUsuario").click(function () {
        createEditUsuario(); // Nueva usuario
        return false;
    });

    // Inicialización
    $(document).ready(function(){
        $("#criterioUsuario").val("");
        $("#btnBuscarUsuario").click();
    });
</script>
</body>
</html>
