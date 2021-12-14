# Pull base image
From tomcat:8-jre8

# Maintainer
MAINTAINER "Siham@gmail.com">

# Copy to images tomcat path
ADD webapp/target/webapp.war /usr/local/tomcat/webapps/





