package com.svalero.tiendaplantas.dao;

import com.svalero.tiendaplantas.domain.Product;
import com.svalero.tiendaplantas.domain.Shop;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ShopDao {

    @SqlQuery("SELECT * FROM shops")
    @UseRowMapper(ShopMapper.class)
    public List<Shop> getAllShops();

    @SqlQuery("SELECT * FROM shops WHERE shop_id = ?")
    @UseRowMapper(ShopMapper.class)
    public Shop getShopById(int id);

    @SqlQuery("SELECT * FROM shops WHERE LOCATE(:searchTerm, city) OR LOCATE(:searchTerm, direction);")
    @UseRowMapper(ShopMapper.class)
    List<Shop> searchShop(@Bind("searchTerm") String term);
}
