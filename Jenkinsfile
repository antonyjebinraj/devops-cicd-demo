pipeline {
    agent any
 stages {
  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t demo:latest .' 
                sh 'docker tag demo jebinraj/demo:latest'
                sh 'docker tag demo jebinraj/demo:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
          sh  'docker push jebinraj/demo:latest'
          sh  'docker push jebinraj/demo:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps {
                sh "docker run -d -p 4030:80 jebinraj/demo"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 4001:80 jebinraj/demo"
 
            }
        }
    }
}
  
