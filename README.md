# spring-eureka

* **Build Application**
      
      gradlew clean build
      
* **Create Docker Image**
      
      docker build -t spring-eureka:latest .
      
* **Tag Docker Image**
      
      docker tag spring-eureka:latest lavkeshrathi1/spring-eureka:{ver}
      
* **Push Docker Image**
      
      docker push lavkeshrathi1/spring-eureka:{ver}
      
* **Deploy Docker Image**

      docker run -e "SPRING_PROFILES_ACTIVE=dev" -p {DOCKER_MACHINE_IP}:8761:8080 --name spring-eureka -d lavkeshrathi1/spring-eureka:{ver} 

* **Debug in Docker Container**

      docker run -e "SPRING_PROFILES_ACTIVE=dev"  -e "JAVA_OPTS=-agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n" -p {DOCKER_MACHINE_IP}:8761:8080 -p {DOCKER_MACHINE_IP}:5005:5005 --name spring-eureka -d lavkeshrathi1/spring-eureka:{ver}
            