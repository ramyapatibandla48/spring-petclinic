FROM openjdk:11
RUN mkdir /spc
COPY ./target/spring-petclinic-2.7.0-SNAPSHOT.jar  /spc/spring-petclinic-2.7.0-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "/spc/spring-petclinic-2.7.0-SNAPSHOT.jar"]