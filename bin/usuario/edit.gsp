<%@ page contentType="text/html;charset=UTF-8" %>
<meta name="layout" content="main"/>

<h2>${usuario?.id ? 'Editar' : 'Crear'} Usuario</h2>

<g:hasErrors bean="${usuario}">
    <div class="alert alert-danger">
        <ul><g:eachError bean="${usuario}" var="e"><li><g:message error="${e}"/></li></g:eachError></ul>
    </div>
</g:hasErrors>

<g:form controller="usuario" action="${usuario?.id ? 'update' : 'save'}" method="POST">
    <g:hiddenField name="id" value="${usuario?.id}"/>

    <div class="mb-3">
        <label>Usuario</label>
        <g:textField name="username" class="form-control" value="${usuario?.username}" required=""/>
    </div>

    <div class="mb-3">
        <label>Contraseña</label>
        <g:passwordField name="password" class="form-control" required=""/>
    </div>

    <button type="submit" class="btn btn-success">${usuario?.id ? 'Actualizar' : 'Guardar'}</button>
</g:form>
