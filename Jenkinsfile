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
          sh 'docker build -t abc:latest .'
        }
      }
      stage ('Docker Push') {
        steps {
          sh 'docker push abc:latest'
        }
      }
        
    }
}
          
        
        
      
        
    
  

