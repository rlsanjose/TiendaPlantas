<%@ page import="com.svalero.tiendaplantas.dao.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.tiendaplantas.domain.User" %>
<%@ page import="com.svalero.tiendaplantas.dao.UserDao" %>
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp"%>

<%
int user_id;
String name = "";
String last_name = "";
String email = "";
String passwordLabel = "Contraseña";
int is_admin = 0;
String noAdminCheck = "checked";
String adminCheck = "";
String title = "Nuevo usuario";
String formValue = "Registrar usuario";
String formAction = "add-user";

if (request.getParameter("registered") != null) {
%>
<div class="container"><br><br>
    <%
    if (request.getParameter("registered").equals("true")) {
    %>
    <h5 class="alert alert-success">Usuario registrado.</h5>
    <%
    } else if (request.getParameter("registered").equals("edited")) {
    %>
    <h5 class="alert alert-success">Cambios registrados</h5>
    <%
    } else if (request.getParameter("registered").equals("repeatedEmail")) {
    %>
    <h5 class="alert alert-danger">Correo ya usado. Inténtalo con otro.</h5>
    <%
    } else if (request.getParameter("registered").equals("wrongPassword")) {
    %>
    <h5 class="alert alert-danger">Contraseña antigua incorrecta</h5>
    <%
    } else if (request.getParameter("registered").equals("error")) {
    %>
    <h5 class="alert alert-danger">Ha habido un error. Inténtelo de nuevo.</h5>
    <%
    }
    %>
</div>
<%
}

if (request.getParameter("id") != null) {
    user_id = Integer.parseInt(request.getParameter("id"));

    try {
        Database.connect();
        User user = new User();
        user = Database.jdbi.withExtension(UserDao.class, dao -> dao.getUserById(user_id));

        name = user.getName();
        last_name = user.getLast_name();
        email = user.getEmail();
        is_admin = user.getIs_admin();

        title = "Editar usuario";
        formValue = "Editar usuario";
        formAction = "edit-user";
        passwordLabel = "Contraseña antigua";

        if (is_admin == 1) {
            adminCheck = noAdminCheck;
            noAdminCheck = "";
        }

    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
}

%>
<div class="container">
    <br>
    <div class="col-md-7 col-lg-8">
        <h4 class="mb-3"><%=title%></h4>
        <form action="<%=formAction%>" method="post">
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="name" class="form-label">Nombre</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="" value="<%=name%>" required>
                </div>

                <div class="col-sm-6">
                    <label for="lastName" class="form-label">Apellido/s</label>
                    <input type="text" class="form-control" id="lastName" name="last_name" placeholder="" value="<%=last_name%>" >
                </div>

                <div class="col-12">
                    <label for="email" class="form-label">Email <span class="text-body-secondary"></span></label>
                    <input type="email" class="form-control" id="email" name="email" value="<%=email%>" placeholder="you@example.com" required>
                </div>

                <div class="col-12">
                    <label for="password" class="form-label"><%=passwordLabel%></label>
                    <input type="password" class="form-control" id="password" name="password" value="" placeholder="" required>
                </div>

                <%
                if (request.getParameter("id") != null) {
                %>
                 <div class="col-12">
                    <label for="newPassword" class="form-label">Contraseña nueva</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" value="" placeholder="" required>
                </div>

                <input type="hidden" class="form-control" name="user_id" placeholder="" value="<%=request.getParameter("id")%>">
                <%
                }
                %>

            </div>

            <hr class="my-4">

            <h4 class="mb-3">Rol</h4>

            <div class="my-3">
                <div class="form-check">
                    <input id="no_admin" name="is_admin" value="0" type="radio" class="form-check-input" <%=noAdminCheck%> required>
                    <label class="form-check-label" for="no_admin">Usuario normal</label>
                </div>
                <div class="form-check">
                    <input id="is_admin" name="is_admin" value="1" type="radio" class="form-check-input" <%=adminCheck%> required>
                    <label class="form-check-label" for="is_admin">Administrador</label>
                </div>
            </div>

            <hr class="my-4">

            <input class="w-100 btn btn-primary btn-lg" type="submit" value="<%=formValue%>">
        </form>
    </div>
</div>
<%@ include file="includes/footer.jsp"%>