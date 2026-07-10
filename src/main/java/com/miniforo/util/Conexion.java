package com.miniforo.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    // Se agrega el prefijo jdbc: y se deja solo la ruta del host, base de datos y parámetros SSL
    private static final String URL = "jdbc:postgresql://ep-raspy-sound-atmfvtar-pooler.c-9.us-east-1.aws.neon.tech/neondb?sslmode=require";
    private static final String USER = "neondb_owner";
    private static final String PASSWORD = "npg_B9CUWm4MbHop"; 

    public static Connection getConexion() {
        Connection con = null;

        try {
            // Cambiamos el driver de MySQL por el de PostgreSQL
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión exitosa a la base de datos en Neon.");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error de conexión: " + e.getMessage());
        }

        return con;
    }
}
