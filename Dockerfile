FROM maven:2.7.4-openjdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:11.0.1-jdk-slim
COPY --from=build /target/xChangeServer-0.0.1.SNAPSHOT.jar xChangeServer.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","xChangeServer.jar"]