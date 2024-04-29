package com.svalero.tiendaplantas.dao;

import com.svalero.tiendaplantas.domain.Shop;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.SQLException;
import java.sql.ResultSet;

public class ShopMapper implements RowMapper<Shop> {
    @Override
    public Shop map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Shop(
                rs.getInt("shop_id"),
                rs.getString("city"),
                rs.getString("direction"),
                rs.getString("opening_time")
        );
    }
}
