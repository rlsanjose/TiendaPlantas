<%@ page import="com.svalero.tiendaplantas.dao.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.tiendaplantas.domain.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.svalero.tiendaplantas.dao.ProductDao" %>
<%@ page import="com.svalero.tiendaplantas.domain.Shop" %>
<%@ page import="com.svalero.tiendaplantas.dao.ShopDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="includes/header.jsp" %>

<main>

    <section class="py-5 text-center container">
        <div class="row py-lg-2">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Nuestras plantas</h1>
                <br>
                <p>
                    <a href="#" class="btn btn-primary my-2">Nueva planta</a>
                </p>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-body-tertiary">
        <div class="container">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <%
                    try {
                        Database.connect();
                    } catch (Exception e) {
                %>
                <div class="alert alert-danger" role="alert">
                    Error interno. Inténtalo de nuevo más tarde.
                </div>
                <%
                    }

                    List<Product> productList = new ArrayList<>();
                    productList = Database.jdbi.withExtension(ProductDao.class, dao -> dao.getAllProducts());

                    for (Product product : productList) {

                %>
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="<%=product.getImage_link()%>" class="bd-placeholder-img card-img-top" width="100%" height="225"/>
                        <div class="card-body">
                            <h4 class="card-text"><%=product.getName()%></h4>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                                <small class="text-body-secondary"><%=product.getUnit_price()%> euros</small>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>
            </div>
        </div>
    </div>

    <section class="py-5 text-center container">
        <div class="row py-lg-1">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Dónde puedes encontrarnos</h1>
                <p class="lead text-body-secondary">Visítanos para que podamos darte nuestro mejor servicio.</p>
                <p>
                    <a href="#" class="btn btn-primary my-2">Registrar nueva tienda</a>
                </p>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-body-tertiary">
        <div class="container">

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">

                <%
                    try {
                        Database.connect();
                    } catch (Exception e) {
                %>
                <div class="alert alert-danger" role="alert">
                    Error interno. Inténtalo de nuevo más tarde.
                </div>
                <%
                    }

                    List<Shop> shopList = new ArrayList<>();
                    shopList = Database.jdbi.withExtension(ShopDao.class, dao -> dao.getAllShops());

                    for (Shop shop : shopList) {
                %>
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="https://cdn1.iconfinder.com/data/icons/nuuline-shops-venues/128/shop_store_retail_commerce-02-512.png" class="bd-placeholder-img card-img-top" width="100%" height="225"/>
                        <div class="card-body">
                            <p class="card-text"><strong><%=shop.getCity()%></strong></p>
                            <p class="card-text"><%=shop.getDirection()%></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                    }
                %>
            </div>
        </div>
    </div>
</main>

<%@include file="includes/footer.jsp"%>