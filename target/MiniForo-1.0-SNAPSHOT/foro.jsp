<%@page import="java.util.ArrayList"%>
<%@page import="com.miniforo.dao.MensajeDAO"%>
<%@page import="com.miniforo.modelo.Mensaje"%>
<%@page import="com.miniforo.modelo.Usuario"%>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    MensajeDAO dao = new MensajeDAO();
    ArrayList<Mensaje> mensajes = dao.listar();
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilos.css">
        <title>Sistema MiniForo - Tablero</title>
    </head>
    <body style="align-items: flex-start; padding: 40px 20px;">
        
        <div class="forum-wrapper">

            <header class="forum-header">
                <img 
                  src="https://campusvirtual2.ug.edu.ec/altlogin/assets/images/logo/UgHorizontalColor.svg" 
                  alt="Logo Universidad de Guayaquil" 
                  class="logo-ug-small"
                />
                <div class="user-actions">
                    <span class="welcome-text">Hola, <strong><%=usuario.getNombre()%></strong></span>
                    <a href="perfil.jsp" class="btn-secondary">Mi Perfil</a>
                    <a href="LogoutServlet" class="btn-danger">Cerrar sesión</a>
                </div>
            </header>

            <div class="publish-card">
                <h3>¿Qué tienes en mente?</h3>
                <form action="PublicarMensajeServlet" method="post">
                    <textarea name="mensaje" rows="3" placeholder="Escribe tu mensaje aquí..." required></textarea>
                    <div class="form-actions">
                        <input type="submit" value="Publicar" class="btn-primary">
                    </div>
                </form>
            </div>

            <div class="messages-container">
                <h3 class="section-title">Mensajes Recientes</h3>
                
                <div class="messages-list">
                    <%
                        for (Mensaje m : mensajes) {
                    %>
                    <div class="message-card">
                        <div class="message-header">
                            <span class="message-author"><%=m.getNombreUsuario()%></span>
                            <span class="message-date"><%=m.getFecha()%></span>
                        </div>
                        <div class="message-body">
                            <%=m.getMensaje()%>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>

        </div>
    </body>
</html>