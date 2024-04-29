package com.svalero.tiendaplantas.dao;

import com.svalero.tiendaplantas.domain.User;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface UserDao {
    @SqlQuery("SELECT * FROM users")
    @UseRowMapper(UserMapper.class)
    public List<User> getAllUsers();

    @SqlQuery("SELECT * FROM users WHERE user_id = ?")
    @UseRowMapper(UserMapper.class)
    public User getUserById(int id);
}
