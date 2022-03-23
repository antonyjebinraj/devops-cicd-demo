FROM openjdk:8
WORKDIR /Dockerfile
EXPOSE 8080
ADD target/cicd-demo-0.0.1-SNAPSHOT.jar cicd-demo-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/cicd-demo-0.0.1-SNAPSHOT.jar"]
