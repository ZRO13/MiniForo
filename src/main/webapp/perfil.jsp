<%@ page import="com.miniforo.modelo.Usuario"%>
<%
    // Validación de sesión intacta
    Usuario usuario = (Usuario) session.getAttribute("usuario");

    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilos.css">
    <title>Sistema MiniForo - Mi Perfil</title>
</head>
<body>
    <div class="login-wrapper">

        <img
          src="https://campusvirtual2.ug.edu.ec/altlogin/assets/images/logo/UgHorizontalColor.svg"
          alt="Logo Universidad de Guayaquil"
          class="logo-ug mx-auto mb-6 h-16 w-auto object-contain animate-scale-in"
        />

        <h1 class="main-title">¡Hola, <%=usuario.getNombre()%>!</h1>
        <p class="subtitle">Bienvenido a tu panel de usuario</p>

        <div class="login-card">
            
            <div class="profile-info">
                <p><strong>Usuario:</strong> <%=usuario.getNombre()%></p>
                <p><strong>Correo:</strong> <%=usuario.getCorreo()%></p>
            </div>

            <a href="foro.jsp" style="text-decoration: none;">
                <button class="btn-primary">Entrar al Foro</button>
            </a>

            <div class="register-link">
                ¿Deseas salir? <a href="LogoutServlet" class="text-danger">Cerrar sesión</a>
            </div>
            
        </div>

    </div>
</body>
</html>