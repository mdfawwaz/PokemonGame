package javaFxGame;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;

import java.sql.*;

public class Pokemon {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/POKEMON";
    private static final String DB_USER = "fawwazuddin";
    private static final String DB_PASSWORD = "fawwaz@123";

    public static void displayPokemonTypes() {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT DISTINCT P_TYPE FROM POKEMON";
            try (Statement statement = connection.createStatement();
                 ResultSet resultSet = statement.executeQuery(sql)) {
                System.out.println("Available Pokemon Types:");
                while (resultSet.next()) {
                    String type = resultSet.getString("P_TYPE");
                    System.out.println(type);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        displayPokemonTypes();
    }
}
