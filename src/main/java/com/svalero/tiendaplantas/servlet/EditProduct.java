package com.svalero.tiendaplantas.servlet;

import com.svalero.tiendaplantas.dao.Database;
import com.svalero.tiendaplantas.dao.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/edit-product")
public class EditProduct extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        float unit_price = Float.parseFloat(request.getParameter("unit_price"));
        int stock_number = Integer.parseInt(request.getParameter("stock_number"));
        String image_link = request.getParameter("image_link");
        String type = request.getParameter("type");

        if (id == 0) {
            response.sendRedirect("form-product.jsp?registered=false");
        }
        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(ProductDao.class,
                    dao -> dao.EditProduct(name, description, unit_price, stock_number, image_link, type, id));
            if (affectedRows == 1) {
                response.sendRedirect("form-product.jsp?id=" + id + "&registered=true");
            } else if (affectedRows == 0) {
                response.sendRedirect("form-product.jsp?id=" + id + "&registered=false");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("form-product.jsp?registered=false");
        }
    }
}
