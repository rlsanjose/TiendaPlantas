package com.svalero.tiendaplantas.servlet;

import com.svalero.tiendaplantas.dao.Database;
import com.svalero.tiendaplantas.dao.ShopDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

@WebServlet("/edit-shop")
public class EditShop extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");

        int shop_id = Integer.parseInt(request.getParameter("id"));
        String city = request.getParameter("city");
        String direction = request.getParameter("direction");
        String opening_time = request.getParameter("opening_time");

        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(ShopDao.class, dao -> dao.editShop(city, direction, opening_time, shop_id));

            if (affectedRows == 1) {
                response.sendRedirect("form-shop.jsp?id=" + shop_id + "&registered=true");
            } else if (affectedRows == 0) {
                response.sendRedirect("form-shop.jsp?id=" + shop_id + "&registered=false");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
