pipeline {
  agent any
  
  stages {
    stage('Build Code') {
      steps {
        sh '/opt/maven/bin/mvn clean package -DskipTest=true'
      }
    }
    stage('publish code') {
      steps {
        withSonarQubeEnv('admin') {
                sh 'mvn clean package sonar:sonar'
              }
      }
    }
          
  }
}
