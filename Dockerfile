FROM openjdk:8-alpine
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean install -DskipTests
CMD ["java", "-jar", "target/hello-dev-1.0-SNAPSHOT.jar"]