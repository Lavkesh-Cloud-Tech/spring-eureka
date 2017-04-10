FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp

ADD build/libs/spring-eureka.jar /app.jar
RUN touch /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]

EXPOSE 8080