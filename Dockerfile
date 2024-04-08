
FROM openjdk:17
WORKDIR /app
ADD target/*.jar app.jar
RUN chmod 777 app.jar
EXPOSE 9090
CMD [ "java",".jar","/app/app.jar"]
