package com.miniforo.dao;

import com.miniforo.modelo.Mensaje;
import com.miniforo.util.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MensajeDAO {

    public void publicar(Mensaje mensaje){

        try{

            Connection con = Conexion.getConexion();

            String sql="INSERT INTO mensajes(usuario_id,mensaje) VALUES(?,?)";

            PreparedStatement ps=con.prepareStatement(sql);

            ps.setInt(1,mensaje.getUsuarioId());
            ps.setString(2,mensaje.getMensaje());

            ps.executeUpdate();

        }catch(Exception e){

            System.out.println(e.getMessage());

        }

    }

    public ArrayList<Mensaje> listar(){

        ArrayList<Mensaje> lista=new ArrayList<>();

        try{

            Connection con=Conexion.getConexion();

            String sql="SELECT m.*,u.nombre FROM mensajes m INNER JOIN usuarios u ON m.usuario_id=u.id ORDER BY fecha DESC";

            PreparedStatement ps=con.prepareStatement(sql);

            ResultSet rs=ps.executeQuery();

            while(rs.next()){

                Mensaje m=new Mensaje();

                m.setId(rs.getInt("id"));
                m.setUsuarioId(rs.getInt("usuario_id"));
                m.setNombreUsuario(rs.getString("nombre"));
                m.setMensaje(rs.getString("mensaje"));
                m.setFecha(rs.getString("fecha"));

                lista.add(m);

            }

        }catch(Exception e){

            System.out.println(e.getMessage());

        }

        return lista;

    }

}