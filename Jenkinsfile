pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
              
                bat 'docker build -t demo:latest .' 
                bat 'docker tag demo jebinraj/demo:latest'
                bat 'docker tag demo jebinraj/demo:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "https://hub.docker.com/repository/docker/jebinraj/demo" ]) {
          bat  'docker push jebinraj/demo:latest'
          bat  'docker push jebinraj/demo:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps {
                bat "docker run -d -p 4030:80 jebinraj/demo"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                bat "docker -H ssh://jenkins@172.31.28.25 run -d -p 4001:80 jebinraj/demo"
 
            }
        }
    }
}
  
