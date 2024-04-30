<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@include file="includes/header.jsp"%>

<%
    if (request.getParameter("registered") != null) {
        if (request.getParameter("registered").equals("true")) {
%>
<div class="container"><br><br>
    <h5 class="alert alert-success">Tienda registrada.</h5>
</div>
<%
} else if (request.getParameter("registered").equals("false")) {
%>
<div class="container"><br><br>
    <h5 class="alert alert-danger">Fallo en el registro.</h5>
</div>
<%
        }
    }
%>
<div class="container">
    <br>
    <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Nueva tienda</h4>
        <form action="add-shop" method="post">
            <div class="row g-3">

                <div class="col-12">
                    <label for="city" class="form-label">Ciudad<span class="text-body-secondary"></span></label>
                    <input type="text" class="form-control" id="city" name="city" placeholder="" required>
                </div>
                <div class="col-12">
                    <label for="direction" class="form-label">Dirección<span class="text-body-secondary"></span></label>
                    <input type="text" class="form-control" id="direction" name="direction" placeholder="" required>
                </div>
                <div class="col-12">
                    <label for="opening_time" class="form-label">Horario<span class="text-body-secondary"></span></label>
                    <input type="text" class="form-control" id="opening_time" name="opening_time" placeholder="" required>
                </div>

            </div>

            <hr class="my-4">

            <input class="w-100 btn btn-primary btn-lg" type="submit" value="Registrar producto">
        </form>
    </div>
</div>

<%@include file="includes/footer.jsp"%>