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
import java.sql.SQLIntegrityConstraintViolationException;

@WebServlet("/add-user")
public class AddUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int is_admin = Integer.parseInt(request.getParameter("is_admin"));

        try {
            Database.connect();

            boolean validEmail = false;
            if(Database.jdbi.withExtension(UserDao.class, dao -> dao.getUserByEmail(email)).isEmpty())
                validEmail = true;

            if (validEmail) {
                int affectedRows = Database.jdbi.withExtension(UserDao.class,
                        dao -> dao.addUser(name, last_name, email, password, is_admin));

                response.sendRedirect("form-user.jsp?registered=true");
            } else {
                response.sendRedirect("form-user.jsp?registered=repeatedEmail");
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            response.sendRedirect("form-user.jsp?registered=error");
        } catch (SQLException |ClassNotFoundException | IOException e) {
            e.printStackTrace();
            response.sendRedirect("form-user.jsp?registered=error");
        }
    }

}
