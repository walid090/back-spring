FROM eclipse-temurin:21-jre
COPY target/*.jar app.jar
VOLUME /tmp
ENTRYPOINT ["java","-jar","/app.jar"]
EXPOSE 8080