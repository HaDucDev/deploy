#
# Build stage
#
FROM maven:3.8.2-jdk-8 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests

#
# Package stage
#
FROM openjdk:8
COPY --from=build /target/beshop-springboot.jar beshop-springboot.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","beshop-springboot.jar.jar"]