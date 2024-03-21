pipeline {
  agent any 
    stages {
      stage ('Build') {
        steps {
          sh '/opt/maven/bin/mvn clean install'
        }
    }
      stage ('Building Image') {
        steps {
          sh 'docker build -t gs:v1 -f /devops/DevOps-K8s-Security/Dockerfile .'
          
        
        }
      }
        
    }
  
}
