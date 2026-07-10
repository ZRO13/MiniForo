package com.miniforo.dao;

import com.miniforo.modelo.Usuario;
import com.miniforo.util.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {

    public boolean registrar(Usuario usuario) {

        String sql = "INSERT INTO usuarios(nombre,correo,password) VALUES (?,?,?)";

        try {

            Connection con = Conexion.getConexion();

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getCorreo());
            ps.setString(3, usuario.getPassword());

            ps.executeUpdate();

            return true;

        } catch (Exception e) {

            System.out.println(e.getMessage());

            return false;

        }

    }

    public Usuario iniciarSesion(String correo, String password) {

        String sql = "SELECT * FROM usuarios WHERE correo=? AND password=?";

        try {

            Connection con = Conexion.getConexion();
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, correo);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Usuario usuario = new Usuario();

                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setPassword(rs.getString("password"));

                return usuario;

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return null;

    }

}
