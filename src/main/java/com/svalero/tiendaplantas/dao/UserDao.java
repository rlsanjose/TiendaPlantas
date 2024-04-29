package com.svalero.tiendaplantas.dao;

import com.svalero.tiendaplantas.domain.Product;
import com.svalero.tiendaplantas.domain.User;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

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

    @SqlUpdate("DELETE FROM users WHERE user_id = ?")
    void removeUser(int id);
}
