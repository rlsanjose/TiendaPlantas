package com.svalero.tiendaplantas.dao;

import com.svalero.tiendaplantas.domain.User;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserMapper implements RowMapper<User> {
    @Override
    public User map(ResultSet rs, StatementContext ctx) throws SQLException {
       return new User(
               rs.getInt("user_id"),
               rs.getString("name"),
               rs.getString("last_name"),
               rs.getString("email"),
               rs.getString("pass"),
               rs.getInt("is_admin"));
    }
}
