FROM maven:3.8-jdk-11-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:11-jre-slim
WORKDIR /app
COPY --from=build /app/target/hello-world-java-1.0-SNAPSHOT.jar /app/HelloWorld.jar
CMD ["java", "-jar", "/app/HelloWorld.jar"]
