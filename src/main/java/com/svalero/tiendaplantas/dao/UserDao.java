package com.svalero.tiendaplantas.dao;

import com.svalero.tiendaplantas.domain.Product;
import com.svalero.tiendaplantas.domain.User;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

public interface UserDao {
    @SqlQuery("SELECT * FROM users")
    @UseRowMapper(UserMapper.class)
    public List<User> getAllUsers();

    @SqlQuery("SELECT * FROM users WHERE user_id = ?")
    @UseRowMapper(UserMapper.class)
    public User getUserById(int id);

    @SqlQuery("SELECT * FROM users WHERE LOCATE(:searchTerm, name) OR LOCATE(:searchTerm, last_name) OR LOCATE(:searchTerm, email);")
    @UseRowMapper(UserMapper.class)
    List<User> searchUsers(@Bind("searchTerm") String term);

    @SqlQuery("SELECT * FROM users WHERE email = ?")
    @UseRowMapper(UserMapper.class)
    List<User> getUserByEmail(String email);

    @SqlQuery("SELECT * FROM users WHERE user_id = ? AND pass = SHA1(?)")
    @UseRowMapper(UserMapper.class)
    List<User> getUserByIdAndPassword(int id, String password);

    @SqlUpdate("DELETE FROM users WHERE user_id = ?")
    void removeUser(int id);

    @SqlUpdate("INSERT INTO users (name, last_name, email, pass, is_admin) VALUES (?, ?, ?, SHA1(?), ?)")
    int addUser(String name, String lastName, String email, String password, int isAdmin) throws SQLIntegrityConstraintViolationException;

    @SqlUpdate("UPDATE users " +
            "SET name = ?, last_name = ?, email = ?, pass = SHA1(?), is_admin = ? " +
            "WHERE user_id = ?")
    int editUser(String name, String last_name, String email, String pass, int is_admin, int userId);
}
