package com.svalero.tiendaplantas.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;

import java.sql.SQLException;

import static com.svalero.tiendaplantas.util.Constants.*;

public class Database {

    public static Handle db;
    public static Jdbi jdbi;

    public void connect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        jdbi = Jdbi.create(USERNAME, PASSWORD, URL);
        jdbi.installPlugin(new SqlObjectPlugin());
        db = jdbi.open();
    }

    public void close() throws SQLException {
        db.close();
    }
}
