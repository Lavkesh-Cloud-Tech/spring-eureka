FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp

ADD build/libs/spring-eureka.jar /app.jar
RUN touch /app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

EXPOSE 8080