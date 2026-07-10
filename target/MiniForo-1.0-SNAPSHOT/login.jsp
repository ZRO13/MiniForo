<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilos.css">
    <title>Sistema de Gestión de Cursos - Login</title>
</head>
<body>
    <div class="login-wrapper">

        <img
          src="https://campusvirtual2.ug.edu.ec/altlogin/assets/images/logo/UgHorizontalColor.svg"
          alt="Logo Universidad de Guayaquil"
          class="logo-ug mx-auto mb-6 h-16 w-auto object-contain animate-scale-in"
        />

        <h1 class="main-title">Sistema MiniForo</h1>
        <p class="subtitle">Inicia sesión para continuar</p>

        <div class="login-card">
            <form action="LoginServlet" method="post">

                <div class="form-group">
                    <label for="correo">Usuario <span class="required">*</span></label>
                    <input type="email" id="correo" name="correo" required placeholder="Ingresa tu correo">
                </div>

                <div class="form-group">
                    <label for="password">Contraseña <span class="required">*</span></label>
                    <input type="password" id="password" name="password" required placeholder="••••••••••••••">
                </div>

                <input type="submit" value="Iniciar Sesión" class="btn-primary">

            </form>

            <div class="register-link">
                No tienes una cuenta? <a href="registro.jsp">Regístrate aquí</a>
            </div>
        </div>

    </div>
</body>
</html>
