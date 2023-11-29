pipeline {
  agent any
  tools { 
        maven 'Maven 3.9.0' 
        jdk 'jdk11.0.20.1'
    }
  stages {
    stage('Build Code') {
      steps {
        sh 'mvn clean package -DskipTest=true'
      }
    }
  }
}
