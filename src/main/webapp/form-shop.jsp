<%@ page import="com.svalero.tiendaplantas.dao.Database" %>
<%@ page import="com.svalero.tiendaplantas.dao.ShopDao" %>
<%@ page import="com.svalero.tiendaplantas.domain.Shop" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@include file="includes/header.jsp"%>

<%
    int id;
    String city = "";
    String direction = "";
    String opening_time = "";
    String title = "Nueva tienda";
    String formValue = "Crear tienda";
    String formAction = "add-shop";

    if (request.getParameter("registered") != null) {
%>
<div class="container"><br><br>
<%
        if (request.getParameter("registered").equals("true")) {
%>
    <h5 class="alert alert-success">Tienda registrada.</h5>
<%
        } else if (request.getParameter("registered").equals("false")) {
%>
    <h5 class="alert alert-danger">Fallo en el registro.</h5>
<%
        }
%>
</div>
<%
    }
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        Shop shop = new Shop();

        try {
            Database.connect();
            shop = Database.jdbi.withExtension(ShopDao.class, dao -> dao.getShopById(id));

            city = shop.getCity();
            direction = shop.getDirection();
            opening_time = shop.getOpening_time();

            title = "Editar tienda";
            formValue = "Editar tienda";
            formAction = "edit-shop?id=" + id;

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<div class="container">
    <br>
    <div class="col-md-7 col-lg-8">
        <h4 class="mb-3"><%=title%></h4>
        <form action="<%=formAction%>" method="post">
            <div class="row g-3">

                <div class="col-12">
                    <label for="city" class="form-label">Ciudad<span class="text-body-secondary"></span></label>
                    <input type="text" class="form-control" id="city" name="city" value="<%=city%>" placeholder="" required>
                </div>
                <div class="col-12">
                    <label for="direction" class="form-label">Dirección<span class="text-body-secondary"></span></label>
                    <input type="text" class="form-control" id="direction" name="direction" value="<%=direction%>" placeholder="" required>
                </div>
                <div class="col-12">
                    <label for="opening_time" class="form-label">Horario<span class="text-body-secondary"></span></label>
                    <input type="text" class="form-control" id="opening_time" name="opening_time" value="<%=opening_time%>" placeholder="" required>
                </div>

            </div>

            <hr class="my-4">

            <input class="w-100 btn btn-primary btn-lg" type="submit" value="<%=formValue%>">
        </form>
    </div>
</div>

<%@include file="includes/footer.jsp"%>