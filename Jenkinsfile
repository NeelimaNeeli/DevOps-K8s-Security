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
          sh 'docker login -u neelima640 -p Peacock@2127'
          //Before pushing a docker image, we have to tag that image to our private dockerhub.
          sh 'docker tag abc:latest neelima640/abc:latest'
          sh 'docker push neelima640/abc:latest'
        }
      }
      stage ('Creating Docker Container') {
        steps {
          sh 'docker run -d -p 8081:8080 neelima640/abc:latest'
        }
      }
        
    }
}
          
        
        
      
        
    
  

