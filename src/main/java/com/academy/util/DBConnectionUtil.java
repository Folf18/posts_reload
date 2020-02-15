package com.academy.util;

import com.academy.service.PropertiesService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

public class DBConnectionUtil {

/*    private static final String URL = "jdbc:postgresql://localhost:5432/posts_demo";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "postgres";
    private static final String DRIVER = "org.postgresql.Driver"; */
    private static Connection connection = null;


    public static Connection getConnection() {

        if( connection != null) {
            return connection;
        } else {
            try {
                Map<String, String> properties = PropertiesService.getInstance().getDatabaseProperties();
                Class.forName(properties.get("driver"));
                connection = DriverManager.getConnection(properties.get("url"), properties.get("username"), properties.get("password"));
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return connection;
        }

    }
}
