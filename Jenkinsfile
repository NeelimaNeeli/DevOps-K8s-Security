pipeline {
  agent any
  stages {
    stage('Build Code') {
      steps {
        sh 'mvn clean package -DskipTest=true'
      }
    }
  }
}
