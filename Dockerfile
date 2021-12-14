FROM anapsix/alpine-java 
LABEL maintainer="siham@gmail.com"
USER root
copy target/server.jar server.jar
ENTRYPOINT ["java", "-jar","server.jar"]
EXPOSE 8080
