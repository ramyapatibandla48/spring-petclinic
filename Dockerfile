FROM openjdk:11
RUN mkdir /spc
COPY ./target/spring-petclinic-2.7.0-SNAPSHOT.jar.original  /spc/spring-petclinic-2.7.0-SNAPSHOT.jar.original
EXPOSE 8080
CMD ["java", "-jar", "/spc/spring-petclinic-2.7.0-SNAPSHOT.jar.original"]