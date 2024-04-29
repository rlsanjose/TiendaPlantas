<%@ page import="com.svalero.tiendaplantas.dao.Database" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.svalero.tiendaplantas.domain.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.svalero.tiendaplantas.dao.ProductDao" %>
<%@ page import="com.svalero.tiendaplantas.domain.Shop" %>
<%@ page import="com.svalero.tiendaplantas.dao.ShopDao" %>
<%@ page import="com.svalero.tiendaplantas.domain.User" %>
<%@ page import="com.svalero.tiendaplantas.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="includes/header.jsp"%>

<main>
    <section class="py-5 text-center container">
        <div class="row py-lg-2">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Administrar usuarios</h1>
                <br>
                <p>
                    <a href="#" class="btn btn-primary my-2">Nuevo usuario</a>
                </p>
                <form class="d-flex flex-wrap justify-content-center" role="search">
                    <div>
                        <input type="text" class="form-control form-control-dark text-bg-dark" placeholder="Busca un usuario" aria-label="Search" name="search">
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

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4 g-3">
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

                    List<User> userList = new ArrayList<>();
                    userList = Database.jdbi.withExtension(UserDao.class, dao -> dao.getAllUsers());

                    for (User user : userList) {

                %>
                <div class="col">
                    <div class="card shadow-sm">
                        <img src="https://static.vecteezy.com/system/resources/previews/000/574/512/large_2x/vector-sign-of-user-icon.jpg" class="bd-placeholder-img card-img-top"/>
                        <div class="card-body">
                            <% if (user.getLast_name() == null || user.getLast_name().isEmpty() ) {
                                %>
                            <h4 class="card-text"><strong><%=user.getName()%></strong></h4>
                                <%
                            } else {
                                %>
                            <h4 class="card-text"><strong><%=user.getName() + " " + user.getLast_name()%></strong></h4>
                                <%
                            }
                            %>
                            <p class="card-text"><%=user.getEmail()%></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="user-detail.jsp?id=<%=user.getUser_id()%>" type="button" class="btn btn-sm btn-outline-secondary">Ver</a>
                                    <button type="button" class="btn btn-sm btn-outline-secondary">Editar</button>
                                    <a href="" type="button" class="btn btn-sm btn-outline-secondary">Eliminar</a>
                                </div>
                                <%
                                    if(user.getIs_admin()==1) {
                                %>
                                <small class="text-body-secondary">Administrador</small>
                                <%
                                    }
                                %>
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