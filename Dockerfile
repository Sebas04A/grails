FROM gradle:6.9-jdk8 as builder

# Instalar dependencias necesarias
USER root
RUN apt-get update && apt-get install -y curl unzip zip

# Instalar SDKMAN y Grails
RUN curl -s https://get.sdkman.io | bash && \
    bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install grails 3.3.18 && sdk use grails 3.3.18 && grails -version"

# Definir el entorno correctamente
ENV SDKMAN_DIR="/root/.sdkman"
ENV PATH="$SDKMAN_DIR/candidates/grails/current/bin:$PATH"

# Copiar la app
COPY . /app
WORKDIR /app

# Generar el WAR
RUN grails war

# Imagen final ligera
FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.war app.war

EXPOSE 8080
CMD ["java", "-Dserver.port=8080", "-jar", "app.war"]
