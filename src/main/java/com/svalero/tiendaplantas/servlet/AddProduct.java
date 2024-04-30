package com.svalero.tiendaplantas.servlet;

import com.svalero.tiendaplantas.dao.Database;
import com.svalero.tiendaplantas.dao.ProductDao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/add-product")
public class AddProduct extends HttpServlet {

    @Override
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        float unit_price = Float.parseFloat(request.getParameter("unit_price"));
        int stock_number = Integer.parseInt(request.getParameter("stock_number"));
        String image_link = request.getParameter("image_link");
        String type = request.getParameter("type");

        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(ProductDao.class,
                    dao -> dao.addProduct(name, description, unit_price, stock_number, image_link, type));
            if (affectedRows == 1) {
                response.sendRedirect("form-product.jsp?registered=true");
            } else {
                response.sendRedirect("form-product.jsp?registered=false");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
