FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp

ADD build/libs/spring-eureka.jar /spring-eureka.jar
RUN touch /spring-eureka.jar

ENTRYPOINT ["java","-jar","/spring-eureka.jar"]

EXPOSE 8080