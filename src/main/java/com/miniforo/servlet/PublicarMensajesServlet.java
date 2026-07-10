package com.miniforo.servlet;

import com.miniforo.dao.MensajeDAO;
import com.miniforo.modelo.Mensaje;
import com.miniforo.modelo.Usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PublicarMensajeServlet")
public class PublicarMensajesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();

        Usuario usuario = (Usuario) sesion.getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String texto = request.getParameter("mensaje");

        Mensaje mensaje = new Mensaje();
        mensaje.setUsuarioId(usuario.getId());
        mensaje.setMensaje(texto);

        MensajeDAO dao = new MensajeDAO();
        dao.publicar(mensaje);

        response.sendRedirect("foro.jsp");
    }
}
