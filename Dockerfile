
FROM tomcat:8.0.20-jre8

RUN sudo docker run -it --rm -p -s 8888:8080 tomcat:8.0

RUN mkdir /usr/local/tomcat/webapps/myapps

COPY project/target/project-1.0-RAMA.war /usr/local/tomcat/webapps/project-1.0-RAMA.war

