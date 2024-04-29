package com.svalero.tiendaplantas.dao;

import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import com.svalero.tiendaplantas.domain.Product;

import java.util.List;

public interface ProductDao {

    @SqlQuery("SELECT * FROM products")
    @UseRowMapper(ProductMapper.class)
    List<Product> getAllProducts();

    @SqlQuery("SELECT * FROM products WHERE product_id = ?")
    @UseRowMapper(ProductMapper.class)
    Product getProductById(int productId);

    @SqlQuery("SELECT * FROM products WHERE LOCATE(:searchTerm, name) OR LOCATE(:searchTerm, description);")
    @UseRowMapper(ProductMapper.class)
    List<Product> searchProducts(@Bind("searchTerm") String term);

    @SqlUpdate("DELETE FROM products WHERE product_id = ?")
    void removeProduct(int productId);
}
