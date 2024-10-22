package com.mycompany.bodegao.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Database {
    private Connection connection;

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(
                "jdbc:mariadb://localhost:3306/bodega",
                "root", ""
            );
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean isConnected() {
        try {
            if (connection == null || connection.isClosed()) {
                connection = getConnection();
            }
            return connection != null && !connection.isClosed();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
