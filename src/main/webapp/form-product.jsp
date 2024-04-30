<%@ page import="com.svalero.tiendaplantas.dao.Database" %>
<%@ page import="com.svalero.tiendaplantas.domain.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.svalero.tiendaplantas.dao.ProductDao" %>
<%@ page import="java.sql.SQLException" %>
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="includes/header.jsp"%>

<%
int productId;
String productName = "";
String productDescription = "";
float productPrice = 0;
int productStock = 0;
String productImage = "";
String productType = "";

String smallCheck = "checked";
String mediumCheck = "";
String bigCheck = "";

String formTitle = "Nuevo producto";
String actionLink = "add-product";
String buttonText = "Registrar producto";

if (request.getParameter("registered") != null) {
%>
<div class="container"><br><br>
<%
    if (request.getParameter("registered").equals("true")) {
%>
    <h4 class="alert alert-success">Producto registrado.</h4>
<%
    } else if (request.getParameter("registered").equals("false")) {
%>
    <h4 class="alert alert-danger">Producto no registrado.</h4>
    <%
    }
    %>
</div>
<%
}
if (request.getParameter("id") != null) {
    productId = Integer.parseInt(request.getParameter("id"));
    Product product;

    try {
        Database.connect();
        product = Database.jdbi.withExtension(ProductDao.class,
                dao -> dao.getProductById(productId));

        productName = product.getName();
        productDescription = product.getDescription();
        productPrice = product.getUnit_price();
        productStock = product.getStock_number();
        productImage = product.getImage_link();
        productType = product.getType();

        switch (productType) {
            case "Medium":
                mediumCheck = smallCheck;
                smallCheck = "";
                break;
            case "Big":
                bigCheck = smallCheck;
                smallCheck = "";
                break;
        }

        formTitle = "Editar producto";
        actionLink = "edit-product?id=" + productId;
        buttonText = "Modificar producto";

    } catch (ClassNotFoundException | SQLException e){
        e.printStackTrace();
    }

} else {
    productId = 0;
}
%>
<div class="container">
    <br>
    <div class="col-md-7 col-lg-8">
        <h4 class="mb-3"><%=formTitle%></h4>
        <form action="<%=actionLink%>" method="post">
            <div class="row g-3">

                <div class="col-12">
                    <label for="name" class="form-label">Nombre científico <span class="text-body-secondary"></span></label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="" value="<%=productName%>" required>
                </div>

                <div class="col-sm-6">
                    <label for="unit_price" class="form-label">Precio</label>
                    <input type="number" step="0.01" class="form-control" id="unit_price" name="unit_price" placeholder="" value="<%=productPrice%>" required>
                </div>

                <div class="col-sm-6">
                    <label for="stock_number" class="form-label">Número en stock</label>
                    <input type="number" class="form-control" id="stock_number" name="stock_number" placeholder="" value="<%=productStock%>" >
                </div>

                <div class="col-12">
                    <label for="description" class="form-label">Descripción</label>
                    <input type="text" class="form-control" id="description" name="description" value="<%=productDescription%>" placeholder="" required>
                </div>

                <div class="col-12">
                    <label for="image_link" class="form-label">URL de imagen</label>
                    <input type="url" class="form-control" id="image_link" name="image_link" value="<%=productImage%>" placeholder="" required>
                    <input type="hidden" name="id" value="<%=productId%>">
                </div>
            </div>

            <hr class="my-4">

            <h5 class="mb-3">Tipo</h5>

            <div class="my-3">
                <div class="form-check">
                    <input id="Small" name="type" value="Small" type="radio" class="form-check-input" <%=smallCheck%> required>
                    <label class="form-check-label" for="Small">Small</label>
                </div>
                <div class="form-check">
                    <input id="Medium" name="type" value="Medium" type="radio" class="form-check-input" <%=mediumCheck%> required>
                    <label class="form-check-label" for="Medium">Medium</label>
                </div>
                <div class="form-check">
                    <input id="Big" name="type" value="Big" type="radio" class="form-check-input" <%=bigCheck%> required>
                    <label class="form-check-label" for="Big">Big</label>
                </div>
            </div>

            <hr class="my-4">

            <input class="w-100 btn btn-primary btn-lg" type="submit" value="<%=buttonText%>">
        </form>
    </div>
</div>

<%@ include file="includes/footer.jsp"%>