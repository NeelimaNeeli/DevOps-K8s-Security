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
        withSonarQubeEnv('sonar') {
                sh 'mvn clean package sonar:sonar'
              }
      }
    }
          
  }
}
