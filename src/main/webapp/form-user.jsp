<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp"%>

<%
if (request.getParameter("registered") != null) {
    if (request.getParameter("registered").equals("true")) {
%>
<div class="container"><br><br>
    <h5 class="alert alert-success">Usuario registrado</h5>
</div>
<%
    } else if (request.getParameter("registered").equals("false")) {
%>
<div class="container"><br><br>
    <h5 class="alert alert-danger">Email repetido. Prueba con otro</h5>
</div>
<%
    }
}
%>
<div class="container">
    <br>
    <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Nuevo usuario</h4>
        <form action="add-user" method="post">
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="name" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="" value="" required>
                </div>

                <div class="col-sm-6">
                    <label for="lastName" class="form-label">Apellido/s</label>
                    <input type="text" class="form-control" id="lastName" name="last_name" placeholder="" value="" >
                </div>

                <div class="col-12">
                    <label for="email" class="form-label">Email <span class="text-body-secondary"></span></label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="you@example.com" required>
                </div>

                <div class="col-12">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="password" name="password" value="" placeholder="" required>
                </div>

            </div>

            <hr class="my-4">

            <h4 class="mb-3">Rol</h4>

            <div class="my-3">
                <div class="form-check">
                    <input id="no_admin" name="is_admin" value="0" type="radio" class="form-check-input" checked required>
                    <label class="form-check-label" for="no_admin">Usuario normal</label>
                </div>
                <div class="form-check">
                    <input id="is_admin" name="is_admin" value="1" type="radio" class="form-check-input" required>
                    <label class="form-check-label" for="is_admin">Administrador</label>
                </div>
            </div>

            <hr class="my-4">

            <input class="w-100 btn btn-primary btn-lg" type="submit" value="Registrar usuario">
        </form>
    </div>
</div>
<%@ include file="includes/footer.jsp"%>