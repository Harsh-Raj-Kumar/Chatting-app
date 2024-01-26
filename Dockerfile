FROM openjdk:11 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:11.0.21-jdk-slim
COPY --from=build /target/xChangeServer-0.0.1.SNAPSHOT.jar xChangeServer.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","xChangeServer.jar"]