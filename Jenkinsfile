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
          sh 'docker build -t abc:latest -f /home/neelima/devops/DevOps-K8s-Security/Dockerfile .'
          
        
        }
      }
        
    }
  
}
