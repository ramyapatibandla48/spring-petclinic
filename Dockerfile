FROM openjdk:11
RUN mkdir /spc
COPY ./target/*.jar  /spc/*.jar
EXPOSE 8080
CMD ["java", "-jar", "/spc/*.jar"]