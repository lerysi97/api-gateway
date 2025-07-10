FROM eclipse-temurin:21-jre-jammy
ARG JAR_FILE=target/api-gateway-*.jar
COPY ${JAR_FILE} app.jar

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:8085/actuator/health || exit 1

EXPOSE 8085
ENTRYPOINT ["java", "-jar", "app.jar"]