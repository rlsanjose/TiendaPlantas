package com.svalero.tiendaplantas.servlet;

import com.svalero.tiendaplantas.dao.Database;
import com.svalero.tiendaplantas.dao.ShopDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.io.IOException;


@WebServlet("/add-shop")
public class AddShop extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String city = request.getParameter("city");
        String direction = request.getParameter("direction");
        String opening_time = request.getParameter("opening_time");

        try {
            Database.connect();
            int rowsAffected = 0;
            rowsAffected = Database.jdbi.withExtension(ShopDao.class,
                    dao -> dao.addShop(city, direction, opening_time));

            if (rowsAffected == 1) {
                response.sendRedirect("form-shop.jsp?registered=true");
            } else {
                response.sendRedirect("form-shop.jsp?registered=false");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
