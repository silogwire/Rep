FROM anapsix/alpine-java 
LABEL maintainer="siham@gmail.com"
ADD server/target/server.jar server.jar
ENTRYPOINT ["java", "-jar","server.jar"]
EXPOSE 8080
