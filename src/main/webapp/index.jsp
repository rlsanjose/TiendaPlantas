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
                <form class="d-flex flex-wrap justify-content-center" role="search">
                    <div>
                        <input type="text" class="form-control form-control-dark text-bg-dark" placeholder="Busca una planta..." aria-label="Search" name="search-plant">
                    </div>
                    <div>
                        <button type="submit" class="btn btn-outline-light me-2">Buscar</button>
                    </div>
                </form>
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

                    if (request.getParameter("search-plant") == null) {
                        productList = Database.jdbi.withExtension(ProductDao.class, dao -> dao.getAllProducts());
                    } else {
                        String search_term = request.getParameter("search-plant");
                        productList = Database.jdbi.withExtension(ProductDao.class, dao -> dao.searchProducts(search_term));
                    }

                    if (productList.size() > 0) {
                        for (Product product : productList) {
                %>
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="<%=product.getImage_link()%>" class="bd-placeholder-img card-img-top" width="100%" height="225"/>
                        <div class="card-body">
                            <h4 class="card-text"><i><%=product.getName()%></i></h4>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="product-detail.jsp?id=<%=product.getProduct_id()%>" class="btn btn-sm btn-outline-secondary">Ver</a>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Eliminar</button>
                                </div>
                                <small class="text-body-secondary"><%=product.getUnit_price()%> euros</small>
                            </div>
                        </div>
                    </div>
                </div>

                <%
                        }
                    } else { %>
                        <div class="alert alert-danger">
                            <h3>No se han encontrado productos</h3>
                        </div>
                        <% }
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
                <form class="d-flex flex-wrap justify-content-center" role="search">
                    <div>
                        <input type="text" class="form-control form-control-dark text-bg-dark" placeholder="Busca una tienda..." aria-label="Search" name="search-shop">
                    </div>
                    <div>
                        <button type="submit" class="btn btn-outline-light me-2">Buscar</button>
                    </div>
                </form>
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
                        <img src="https://cdn1.iconfinder.com/data/icons/nuuline-shops-venues/128/shop_store_retail_commerce-02-512.png" class="bd-placeholder-img card-img-top"/>
                        <div class="card-body">
                            <p class="card-text"><strong><%=shop.getCity()%></strong></p>
                            <p class="card-text"><%=shop.getDirection()%></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="shop-detail.jsp?id=<%=shop.getShop_id()%>" type="button" class="btn btn-sm btn-outline-secondary">Ver</a>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Eliminar</button>
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