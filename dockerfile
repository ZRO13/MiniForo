# ==========================================
# Etapa 1: Compilación (Build)
# ==========================================
FROM maven:3.9-eclipse-temurin-11 AS builder
WORKDIR /app

# Descargamos dependencias
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiamos el código fuente y empaquetamos
COPY src ./src
RUN mvn clean package -DskipTests

# ==========================================
# Etapa 2: Producción (Run)
# ==========================================
# ⚠️ CAMBIO CRÍTICO: Usamos Tomcat 9 (Compatible con Javax) y JDK 11
FROM tomcat:9.0-jdk11

# Limpieza de aplicaciones por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiamos el .war y lo renombramos a ROOT.war
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Permisos necesarios para OpenShift
RUN chmod -R 777 /usr/local/tomcat/webapps /usr/local/tomcat/work /usr/local/tomcat/logs /usr/local/tomcat/temp

EXPOSE 8080

CMD ["catalina.sh", "run"]
