<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>
<h2>Listado de Usuarios</h2>

<g:if test="${flash.message}">
    <div class="alert alert-success">${flash.message}</div>
</g:if>

<g:link action="create" class="btn btn-primary mb-3">Nuevo Usuario</g:link>

<table class="table table-striped">
    <thead>
    <tr>
        <th>ID</th>
        <th>Usuario</th>
        <th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${usuarioList}" var="u">
        <tr>
            <td>${u.id}</td>
            <td>${u.username}</td>
            <td>
                <g:link action="edit" id="${u.id}" class="btn btn-sm btn-warning">Editar</g:link>
                <g:form action="delete" method="POST" style="display:inline;">
                    <g:hiddenField name="id" value="${u.id}"/>
                    <g:submitButton name="delete" class="btn btn-sm btn-danger" value="Eliminar" />
                </g:form>
            </td>
        </tr>
    </g:each>
    </tbody>
</table>
