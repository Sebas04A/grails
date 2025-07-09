FROM gradle:6.9-jdk8 as builder

# Instalar Grails 3.3.18 manualmente
RUN apt-get update && apt-get install -y curl unzip && \
    curl -s https://get.sdkman.io | bash && \
    bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk install grails 3.3.18"

# Copiar proyecto
COPY . /app
WORKDIR /app

# Ejecutar build con Grails
RUN bash -c "source /root/.sdkman/bin/sdkman-init.sh && grails war"

# Imagen final
FROM openjdk:8-jdk-alpine
WORKDIR /app

# Copiar el WAR generado
COPY --from=builder /app/build/libs/*.war app.war

EXPOSE 8080
CMD ["java", "-Dserver.port=8080", "-jar", "app.war"]
