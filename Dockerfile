FROM tomcat:10.1.24-jdk21-temurin-jammy
COPY target/numeric-0.0.1.jar /home/neelima/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/home/neelima/app.jar"]
