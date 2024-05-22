FROM maven:3.8.5-jdk-11-slim

ADD spring-hello /app/demo
# RUN mvn -f /tmp/pom.xml clean package

WORKDIR /app/demo
RUN mvn install


# FROM openjdk:8
# ADD /app/demo/target/helloworld-0.0.1-SNAPSHOT.jar helloworld-0.0.1-SNAPSHOT.jar
# ENTRYPOINT ["java", "-jar","helloworld-0.0.1-SNAPSHOT.jar"]
# EXPOSE 8080

# Assignment 2\spring-hello\target\helloworld-0.0.1-SNAPSHOT.jar
