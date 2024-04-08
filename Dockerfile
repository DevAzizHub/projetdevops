FROM openjdk:17
EXPOSE 9090
ADD target/achat-1.0.jar achat.jar
CMD [ "java","-jar","achat.jar"]
