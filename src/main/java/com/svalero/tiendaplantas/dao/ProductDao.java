package com.svalero.tiendaplantas.dao;

import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import com.svalero.tiendaplantas.domain.Product;

import java.util.List;

public interface ProductDao {

    @SqlQuery("SELECT * FROM products")
    @UseRowMapper(ProductMapper.class)
    List<Product> getAllProducts();

}
