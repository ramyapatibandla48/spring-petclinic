FROM openjdk:11
LABEL author=ramya
COPY /target/spring-petclinic-2.7.0-SNAPSHOT.jar  /home/spring-petclinic-2.7.0-SNAPSHOT.jar
EXPOSE 8082:8080
CMD ["java", "-jar", "/spring-petclinic-2.7.0-SNAPSHOT.jar"]