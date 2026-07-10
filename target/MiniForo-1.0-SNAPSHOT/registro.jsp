<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/estilos.css">
    <title>Sistema MiniForo - Registro</title>
</head>
<body>
    <div class="login-wrapper">

        <img
          src="https://campusvirtual2.ug.edu.ec/altlogin/assets/images/logo/UgHorizontalColor.svg"
          alt="Logo Universidad de Guayaquil"
          class="logo-ug mx-auto mb-6 h-16 w-auto object-contain animate-scale-in"
        />

        <h1 class="main-title">Sistema MiniForo</h1>
        <p class="subtitle">Crea una cuenta para comenzar</p>

        <div class="login-card">
            <form action="RegistroServlet" method="post">

                <div class="form-group">
                    <label for="nombre">Nombre <span class="required">*</span></label>
                    <input type="text" id="nombre" name="nombre" required placeholder="Ingresa tu nombre completo">
                </div>

                <div class="form-group">
                    <label for="correo">Correo electrónico <span class="required">*</span></label>
                    <input type="email" id="correo" name="correo" required placeholder="ejemplo@correo.com">
                </div>

                <div class="form-group">
                    <label for="password">Contraseña <span class="required">*</span></label>
                    <input type="password" id="password" name="password" required placeholder="••••••••••••••">
                </div>

                <input type="submit" value="Registrarse" class="btn-primary">

            </form>

            <div class="register-link">
                ¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión aquí</a>
            </div>
        </div>

    </div>
</body>
</html>