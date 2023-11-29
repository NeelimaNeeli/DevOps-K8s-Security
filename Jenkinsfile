pipeline {
  agent any

  stages {
        
        stage('Build') { 
            steps {
                sh '/opt/maven/bin/mvn clean package -DskipTests=true' 
            }
        }
        stage('Deploy Sonarqube') {
            steps {
                
                sh '/usr/bin/docker pull sonarqube:latest'
                  
                }
            }
        
    }
  post {
    success {
      echo 'Build Success'
    }
    failure {
      echo 'Build Failure'
    }
  }
}

