<%@ page import="com.svalero.tiendaplantas.dao.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.tiendaplantas.domain.Product" %>
<%@ page import="com.svalero.tiendaplantas.dao.ProductDao" %>
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

    int product_id = Integer.parseInt(request.getParameter("id"));
    Product product = Database.jdbi.withExtension(ProductDao.class, dao -> dao.getProductById(product_id));
    if (product == null) { %>
<div class="container">
    <h2 class="alert alert-danger">Página no disponible</h2>
</div>
<% } else { %>
<main>
    <br>
    <div class="container text-center">
        <div class="row g-2">
            <div class="col">
                <img src="<%=product.getImage_link()%>" style="max-width: 400px"/>
            </div>
            <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header">
                        <h3 class="my-0 fw-normal"><i><%=product.getName()%></i></h3>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title pricing-card-title"><%=product.getUnit_price()%> €</h4>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li class="mb-1 text-body-secondary">Tipo: <%=product.getType()%></li>
                            <li><%=product.getDescription()%></li>
                            <% if (product.getStock_number() > 1) { %>
                            <li>Hay <%=product.getStock_number()%> unidades disponibles</li>
                            <% } else if (product.getStock_number() == 1) { %>
                            <li>¡Sólo queda una unidad disponible!</li>
                            <% } else { %>
                            <li>Sin stock</li>
                            <%} %>
                        </ul>
                        <a href="#" type="button" class="w-100 btn btn-lg btn-outline-primary">Editar producto</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</main>
<% }
%>
<%@include file="includes/footer.jsp"%>
