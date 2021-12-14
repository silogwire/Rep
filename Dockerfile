FROM openjdk:8
LABEL maintainer="siham@gmail.com"
USER root
copy server/target/server.jar server.jar
ENTRYPOINT ["java", "-jar","server.jar"]
EXPOSE 8080
