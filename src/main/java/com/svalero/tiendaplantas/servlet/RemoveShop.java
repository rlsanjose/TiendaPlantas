package com.svalero.tiendaplantas.servlet;

import com.svalero.tiendaplantas.dao.Database;
import com.svalero.tiendaplantas.dao.ShopDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/remove-shop")
public class RemoveShop extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

       try {
           Database.connect();
           Database.jdbi.withExtension(ShopDao.class, dao -> {
               dao.removeShop(id);
               resp.sendRedirect("index.jsp");
               return null;
           });
       } catch (SQLException e) {
           e.printStackTrace();
       } catch (ClassNotFoundException e) {
           e.printStackTrace();
       }
    }
}
