FROM gradle:6.9-jdk8 as builder
COPY . /app
WORKDIR /app
RUN gradle assemble

FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.war app.war
EXPOSE 8080
CMD ["java", "-Dserver.port=8080", "-jar", "app.war"]
