
FROM tomcat:8.0.20-jre8

RUN COPY /usr/tomcat-users.xml /usr/local/tomcat/conf/

RUN mkdir /usr/local/tomcat/webapps/myapps

COPY project/target/project-1.0-RAMA.war /usr/local/tomcat/webapps/project-1.0-RAMA.war
