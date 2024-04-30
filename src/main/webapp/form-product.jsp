<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp"%>

<%
if (request.getParameter("registered") != null) {
    if (request.getParameter("registered").equals("true")) {
%>
<div class="container"><br><br>
    <h4 class="alert alert-success">Producto registrado.</h4>
</div>
<%
    }
}
%>
<div class="container">
    <br>
    <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">Nuevo producto</h4>
        <form action="add-product" method="post">
            <div class="row g-3">

                <div class="col-12">
                    <label for="name" class="form-label">Nombre científico <span class="text-body-secondary"></span></label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="" required>
                </div>

                <div class="col-sm-6">
                    <label for="unit_price" class="form-label">Precio</label>
                    <input type="number" step="0.01" class="form-control" id="unit_price" name="unit_price" placeholder="" value="" required>
                </div>

                <div class="col-sm-6">
                    <label for="stock_number" class="form-label">Número en stock</label>
                    <input type="number" class="form-control" id="stock_number" name="stock_number" placeholder="" value="" >
                </div>

                <div class="col-12">
                    <label for="description" class="form-label">Descripción</label>
                    <input type="text" class="form-control" id="description" name="description" value="" placeholder="" required>
                </div>

                <div class="col-12">
                    <label for="image_link" class="form-label">URL de imagen</label>
                    <input type="url" class="form-control" id="image_link" name="image_link" value="" placeholder="" required>
                </div>
            </div>

            <hr class="my-4">

            <h5 class="mb-3">Tipo</h5>

            <div class="my-3">
                <div class="form-check">
                    <input id="Small" name="type" value="Small" type="radio" class="form-check-input" checked required>
                    <label class="form-check-label" for="Small">Small</label>
                </div>
                <div class="form-check">
                    <input id="Medium" name="type" value="Medium" type="radio" class="form-check-input" required>
                    <label class="form-check-label" for="Medium">Medium</label>
                </div>
                <div class="form-check">
                    <input id="Big" name="type" value="Big" type="radio" class="form-check-input" required>
                    <label class="form-check-label" for="Big">Big</label>
                </div>
            </div>

            <hr class="my-4">

            <input class="w-100 btn btn-primary btn-lg" type="submit" value="Registrar producto">
        </form>
    </div>
</div>

<%@ include file="includes/footer.jsp"%>