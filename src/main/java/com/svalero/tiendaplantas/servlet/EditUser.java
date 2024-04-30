package com.svalero.tiendaplantas.servlet;

import com.svalero.tiendaplantas.dao.Database;
import com.svalero.tiendaplantas.dao.UserDao;
import com.svalero.tiendaplantas.domain.User;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/edit-user")
public class EditUser extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");

        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String name = request.getParameter("name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");
        int is_admin = Integer.parseInt(request.getParameter("is_admin"));
        List<User> users;
        List<User> allUsers;

        try {
            Database.connect();
            users = Database.jdbi.withExtension(UserDao.class, dao -> dao.getUserByIdAndPassword(user_id, password));

            if (users.isEmpty()) {
                response.sendRedirect("form-user.jsp?id=" + user_id + "&registered=wrongPassword");
                return;
            }

            allUsers = Database.jdbi.withExtension(UserDao.class, dao -> dao.getAllUsers());
            boolean repeatedEmail = false;

            for (User everyUser : allUsers) {
                if (everyUser.getUser_id() == user_id) {
                    continue;
                }

                if (everyUser.getEmail().equals(email)) {
                    repeatedEmail = true;
                    response.sendRedirect("form-user.jsp?id=" + user_id + "&registered=repeatedEmail");
                    return;
                }
            }

            int affectedRows = Database.jdbi.withExtension(UserDao.class,
                    dao -> dao.editUser(name, last_name, email, newPassword, is_admin, user_id));

            if (affectedRows == 1) {
                response.sendRedirect("form-user.jsp?id=" + user_id + "&registered=edited");
            } else if (affectedRows == 0) {
                response.sendRedirect("form-user.jsp?id=" + user_id + "&registered=error");
            }

        } catch (ClassNotFoundException | SQLException | IOException e) {
            e.printStackTrace();
            response.sendRedirect("form-user.jsp?id=" + user_id + "&registered=error");
        }
    }
}
