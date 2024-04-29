<%@ page import="com.svalero.tiendaplantas.dao.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.tiendaplantas.domain.Shop" %>
<%@ page import="com.svalero.tiendaplantas.dao.ShopDao" %>
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

    int shop_id = Integer.parseInt(request.getParameter("id"));
    Shop shop = Database.jdbi.withExtension(ShopDao.class, dao -> dao.getShopById(shop_id));
    if (shop == null) { %>
<div class="container">
    <h2 class="alert alert-danger">Página no disponible</h2>
</div>
<% } else { %>
<main>
    <br>

    <div class="container">
        <div class="card mb-4 rounded-3 shadow-sm">
            <div class="card-header">
                <h2>Encuéntranos en <%=shop.getCity()%></h2>
            </div>
            <div class="card-body">
                <h4>Dirección</h4>
                <p><%=shop.getDirection()%></p>
                <h4>Horario</h4>
                <p><%=shop.getOpening_time()%></p>
                <a href="#" type="button" class="btn btn-lg btn-outline-primary alert alert-success">Editar tienda</a>
                <a href="remove-shop?id=<%=shop.getShop_id()%>" type="button" class="btn btn-lg btn-outline-primary alert alert-danger">Eliminar tienda</a>
            </div>

        </div>
    </div>
</main>
<% }
%>
<%@include file="includes/footer.jsp"%>