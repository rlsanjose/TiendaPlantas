<%@ page import="com.svalero.tiendaplantas.dao.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.tiendaplantas.domain.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.svalero.tiendaplantas.dao.ProductDao" %>
<%@ page import="com.svalero.tiendaplantas.domain.Shop" %>
<%@ page import="com.svalero.tiendaplantas.dao.ShopDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="es" data-bs-theme="dark">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Tienda de Plantas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="icon" type="image/png" href="./images/favicon.png">
    </head>

    <body>
        <header data-bs-theme="dark">

            <div class="navbar navbar-dark bg-dark shadow-sm">
                <div class="container">
                    <a href="/tiendaplantas/" class="navbar-brand d-flex align-items-center">
                        <svg class="me-2" width="20" height="20" viewBox="0 0 24 24" id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#ffffff"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <defs> <style>.cls-1{fill:none;}.cls-2{clip-path:url(#clip-path);}</style> <clipPath id="clip-path"> <rect class="cls-1" x="0.13" width="24" height="24"></rect> </clipPath> </defs> <title>plant</title> <g class="cls-2"> <path d="M10.89,12a1,1,0,0,1-.75-.34,1,1,0,0,1-.24-.78c.41-3.27,2.93-9.44,9.56-9.44a1,1,0,0,1,1,.87,9.42,9.42,0,0,1-2,6.84C16.75,11.05,14.22,12,10.89,12Zm7.6-8.51C14.23,4,12.66,7.94,12.13,10a7,7,0,0,0,4.79-2.12A7,7,0,0,0,18.49,3.5Z"></path> <path d="M10.89,12h-.12c-2.51-.32-7.26-2.26-7.26-7.38a1,1,0,0,1,.88-1A7.26,7.26,0,0,1,9.68,5.2,7.33,7.33,0,0,1,11.89,11a1,1,0,0,1-1,1ZM5.6,5.61c.48,2.57,2.76,3.67,4.21,4.12a4.72,4.72,0,0,0-1.44-3A4.81,4.81,0,0,0,5.6,5.61Z"></path> <path d="M10.89,16.18a1,1,0,0,1-1-1V11a1,1,0,1,1,2,0v4.17A1,1,0,0,1,10.89,16.18Z"></path> <path d="M13.55,22.55H8.63a4,4,0,0,1-4-4V15.18a1,1,0,0,1,1-1H16.55a1,1,0,0,1,1,1v3.37A4,4,0,0,1,13.55,22.55ZM6.63,16.18v2.37a2,2,0,0,0,2,2h4.92a2,2,0,0,0,2-2V16.18Z"></path> </g> </g></svg>
                        <strong>Tienda de plantas</strong>
                    </a>
                    <a href="administrar-usuarios.jsp" class="navbar-toggler">Administrar usuarios</a>
                </div>
            </div>
        </header>

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

        <footer class="text-body-secondary py-5">
            <div class="container">
                <p class="float-end mb-1">
                    <a href="#">Back to top</a>
                </p>
                <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
                <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.3/getting-started/introduction/">getting started guide</a>.</p>
            </div>
        </footer>
        <script src="/docs/5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html>