FROM anapsix/alpine-java 
LABEL maintainer="siham@gmail.com"
//ADD server/target/server.jar server.jar
ENTRYPOINT ["java", "-jar","/var/lib/docker/volumes/jenkins-data/_data/workspace/tp_houcem_pipline/server/target/server.jar"]
EXPOSE 8080
