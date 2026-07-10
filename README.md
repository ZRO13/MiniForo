#  Sistema MiniForo UG

![Java](https://img.shields.io/badge/Java-11-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![JSP/Servlets](https://img.shields.io/badge/JSP_&_Servlets-Javax-007396?style=for-the-badge&logo=java&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Neon_Cloud-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![OpenShift](https://img.shields.io/badge/OpenShift-Deployed-EE0000?style=for-the-badge&logo=redhatopenshift&logoColor=white)

<div align="center">
  <img src="https://campusvirtual2.ug.edu.ec/altlogin/assets/images/logo/UgHorizontalColor.svg" alt="Logo UG" width="300"/>
</div>

##  Descripción del Proyecto
**Sistema MiniForo** es una aplicación web ligera desarrollada en Java (Servlets & JSP) orientada a la gestión de discusiones y cursos. Diseñada con una arquitectura MVC clásica, permite a los estudiantes crear cuentas, iniciar sesión, gestionar su perfil y participar en un tablero de mensajes interactivo.

Destaca por su interfaz de usuario minimalista en **Modo Oscuro**, su conexión a una base de datos PostgreSQL alojada en la nube (Neon), y su preparación nativa para ser desplegada en plataformas de contenedores como **Red Hat OpenShift**.

---

##  Características Principales
* **Autenticación Segura:** Sistema de Registro y Login con manejo de sesiones HTTP.
* **Tablero Comunitario:** Publicación y lectura de mensajes en un muro general.
* **Diseño UI/UX Moderno:** Interfaz minimalista, 100% CSS puro (Dark Mode), tarjetas limpias y alertas intuitivas.
* **Base de Datos Relacional:** Tablas interconectadas con eliminación en cascada (`ON DELETE CASCADE`).
* **Cloud-Ready:** Preparado para despliegue automático mediante un `Dockerfile` multi-etapa optimizado para Tomcat 9.

---

##  Stack Tecnológico

| Capa | Tecnología |
| :--- | :--- |
| **Backend** | Java 11, Servlets (`javax.servlet`), JSP |
| **Frontend** | HTML5, CSS3 (Inter Font, Flexbox) |
| **Gestor de Dependencias**| Apache Maven 3.x |
| **Base de Datos** | PostgreSQL (Neon Database) |
| **Servidor Web** | Apache Tomcat 9 |
| **DevOps** | Docker, OpenShift (S2I) |

---

##  Estructura de la Base de Datos

El sistema utiliza **PostgreSQL** y se compone de dos entidades principales:

```sql
-- Tabla Usuarios
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Tabla Mensajes
CREATE TABLE mensajes (
    id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    nombre_usuario VARCHAR(100) NOT NULL,
    mensaje TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);
