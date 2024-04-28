package com.svalero.tiendaplantas.dao;

import com.svalero.tiendaplantas.domain.Product;
import org.jdbi.v3.core.mapper.RowMapper;
import org.jdbi.v3.core.statement.StatementContext;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductMapper implements RowMapper<Product> {
    @Override
    public Product map(ResultSet rs, StatementContext ctx) throws SQLException {
        return new Product(rs.getInt("product_id"),
                rs.getString("name"),
                rs.getFloat("unit_price"),
                rs.getInt("stock_number"),
                rs.getString("description"),
                rs.getString("image_link"),
                rs.getString("type")
        );
    }
}
