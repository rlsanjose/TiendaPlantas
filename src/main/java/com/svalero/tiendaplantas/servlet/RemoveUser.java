package com.svalero.tiendaplantas.servlet;

import com.svalero.tiendaplantas.dao.Database;
import com.svalero.tiendaplantas.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/remove-user")
public class RemoveUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("id"));

        try {
            Database.connect();
            Database.jdbi.withExtension(UserDao.class, dao -> {
                dao.removeUser(id);
                return null;
            });
            response.sendRedirect("users.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
