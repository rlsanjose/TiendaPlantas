<%@ page import="com.svalero.tiendaplantas.dao.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.tiendaplantas.domain.User" %>
<%@ page import="com.svalero.tiendaplantas.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@include file="includes/header.jsp"%>

<%
    try {
        Database.connect();
    } catch (ClassNotFoundException e) {
        throw new RuntimeException(e);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    int user_id = Integer.parseInt(request.getParameter("id"));
    User user = Database.jdbi.withExtension(UserDao.class, dao -> dao.getUserById(user_id));
    if (user == null) { %>
<div class="container">
    <h2 class="alert alert-danger">Página no disponible</h2>
</div>
<% } else { %>
<main>
    <br>

    <div class="container">
        <div class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header">
                <% if (user.getLast_name() == null) { %>
                    <h2><%=user.getName()%></h2>
                <% } else { %>
                    <h2><%=user.getName()%> <%=user.getLast_name()%></h2>
                <% } %>
            </div>
            <div class="card-body">
                <h4>Email</h4>
                <p><%=user.getEmail()%></p>
                <h4>Rol</h4>
                <% if (user.getIs_admin() == 0) { %>
                    <p>Usuario normal (sin privilegios)</p>
                <% } else { %>
                    <p>Con privilegios de administrador</p>
                <% }%>
                <a href="#" type="button" class="w-100 btn btn-lg btn-outline-primary">Editar usuario</a>
            </div>
        </div>
    </div>
</main>
<% }
%>
<%@include file="includes/footer.jsp"%>