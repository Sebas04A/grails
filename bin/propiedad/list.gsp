<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Propiedades</title>

</head>

<body>
<div class="container mt-4">

    <!-- ENCABEZADO Y ACCIONES -->
    <div class="card shadow-sm mb-4">
        <div class="card-body d-flex justify-content-between align-items-center">
            <h5 class="mb-0"><i class="fa fa-home me-2"></i>Gestión de Propiedades</h5>
            <div>
            <%--
                <g:link controller="inicio" action="index" class="btn btn-outline-secondary me-2">
                    <i class="fa fa-arrow-left me-1"></i> Regresar
                </g:link> --%>
                <a href="#" class="btn btn-success btnCrear">
                    <i class="fa fa-plus me-1"></i> Nueva Propiedad
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
      id="criterio"
      placeholder="Ej: departamento, casa, terreno..."
    />
    <button
      type="button"
      class="btn btn-lg btn-primary rounded-pill px-4"
      id="btnBuscar"
    >
      <i class="fa fa-search me-2"></i> Buscar
    </button>
  </div>
</div>




    <!-- TABLA DE RESULTADOS -->
    <div class="card shadow-sm">
        <div class="card-body p-0">
            <div id="tabla_ajax" class="table-responsive">
                <!-- Aquí se carga dinámicamente la tabla -->
            </div>
        </div>
    </div>

</div>


<script>
    $("#btnBuscar").click(function () {
        var criterio = $("#criterio").val();
        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'propiedad', action:'buscar_ajax')}",
            data: {criterio: criterio},
            success: function (msg) {
                $("#tabla_ajax").html(msg)
            }
        });
    });
    $("#criterio").keypress(function (e) {
        console.log("Key pressed: ", e.keyCode);
        if (e.keyCode === 13) { // Enter key
            e.preventDefault();
            $("#btnBuscar").click();
        }
    });

   
    function mostrar(id) {
    var title = "Ver Propiedad";
    $.ajax({
        type: "POST",
        url: "${createLink(controller: 'propiedad', action:'show_ajax')}",
        data: {id: id},
        success: function (msg) {
            var b = bootbox.dialog({
                title: title,
                closeButton: false,
                message: msg,
                class: "modal-lg",
                buttons: {
                    aceptar: {
                        label: "Aceptar",
                        className: "btn-primary",
                        callback: function () {
                        }
                    }
                },
            }); //dialog
            setTimeout(function () {
                b.find(".form-control").first().focus()
            }, 500);
        } //successJava
    });
    //location.reload()//ajax

    };

    function deleteRow(itemId) {
        console.log("borra",itemId)
        bootbox.dialog({
            title: "Alerta",
            message: "<i class='fa fa-trash fa-3x pull-left text-danger text-shadow'></i><p>" +
                "¿Está seguro que desea eliminar la persona seleccionada? Esta acción no se puede deshacer.</p>",
            closeButton: false,
            buttons: {
                cancelar: {
                    label: "Cancelar",
                    className: "btn-primary",
                    callback: function () {
                    }
                },
                eliminar: {
                    label: "<i class='fa fa-trash'></i> Eliminar",
                    className: "btn-danger",
                    callback: function () {
                        $.ajax({
                            type: "POST",
                            url: '${createLink(controller: 'propiedad', action:'delete_ajax')}',
                            data: {
                                id: itemId
                            },
                            success: function (msg) {
                                if (msg == 'ok') {
                                    setTimeout(function () {
                                        location.reload();
                                    }, 300);
                                } else {
                                    log("Error al borrar la propiedad", "error")
                                }
                            }
                        });
                    }
                }
            }
        });
    }

    function createEditRow(id) {
        var title = id ? "Editar Propiedad" : "Nueva Propiedad";
        var data = id ? {id: id} : {};

        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'propiedad', action: 'form_ajax')}",
            data: data,
            success: function (msg) {
                var b = bootbox.dialog({
                    title: title,
                    message: msg,
                    className: "modal-completo",
                    buttons: {
                        cancelar: {
                            label: "Cancelar",
                            className: "btn-secondary"
                        },
                        guardar: {
                            label: "Guardar",
                            className: "btn-success",
                            callback: function () {
                                return submitForm();
                            }
                        }
                    }
                });

                setTimeout(function () {
                    b.find(".form-control").first().focus();
                }, 500);
            }
        });
    }




    function submitForm() {
        var $form = $("#frmPropiedad");

        console.log("Enviando formulario: ", $form.serialize());

        $.ajax({
            type: "POST",
            url: $form.attr("action"),
            data: $form.serialize(),
            success: function (msg) {
                if (msg === 'ok') {
                    $('.alert').removeClass("hidden").addClass("show").alert();
                    setTimeout(function () {
                        location.reload();
                    }, 500);
                } else {
                    alert("Error al guardar la propiedad.");
                }
            }
        });

        return false;
    }
    $(document).on("click", ".btn-edit", function () {
        var id = $(this).data("id");
        createEditRow(id);
    });

    $(document).on("click", ".btn-borrar", function () {
        var id = $(this).data("id");
        deleteRow(id);
    });

    $(document).on("click", ".btn-show", function () {
        var id = $(this).data("id");
        console.log("Mostrar propiedad con ID:", id);
        mostrar(id);
    });
    $(".btnCrear").click(function () {
            console.log("aplantando boton")
            createEditRow(); // Llama sin ID => Nueva propiedad
            return false;
        });


    $(document).ready(function(){

        $("#criterio").val("");
        $("#btnBuscar").click();
   

    });
</script>

</body>
</html>
