package com.miniforo.servlet;

import com.miniforo.dao.UsuarioDAO;
import com.miniforo.modelo.Usuario;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        UsuarioDAO dao = new UsuarioDAO();

        Usuario usuario = dao.iniciarSesion(correo, password);

        if (usuario != null) {

            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);

            response.sendRedirect("perfil.jsp");

        } else {

            response.getWriter().println("<h2>Correo o contraseña incorrectos</h2>");

        }

    }

}
