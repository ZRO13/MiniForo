# ==========================================
# Etapa 1: Compilación (Build)
# ==========================================
FROM maven:3.9-eclipse-temurin-11 AS builder
WORKDIR /app

# Descargamos dependencias primero para optimizar la caché de Docker
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiamos el código fuente y empaquetamos
COPY src ./src
RUN mvn clean package -DskipTests

# ==========================================
# Etapa 2: Producción (Run)
# ==========================================
# Usamos Tomcat 10 (compatible con Jakarta) y JDK 11
FROM tomcat:10.1-jdk11

# Limpieza de aplicaciones por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiamos el .war y lo renombramos a ROOT.war
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Permisos necesarios para entornos seguros como OpenShift
RUN chmod -R 777 /usr/local/tomcat/webapps /usr/local/tomcat/work /usr/local/tomcat/logs /usr/local/tomcat/temp

EXPOSE 8080

CMD ["catalina.sh", "run"]