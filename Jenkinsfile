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
        withSonarQubeEnv('sonarqube') {
                sh "/opt/maven/bin/mvn clean verify sonar:sonar \
                   -Dsonar.projectKey=devops \
                   -Dsonar.projectName='devops' \
                   -Dsonar.host.url=http://172.17.0.2:9000 \
                   -Dsonar.token=sqp_399c4c54f8a8183b8fb83869afd1bb5fcac612be"
              }
      }
    }
    stage("Quality Gate") {
            steps {
                timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: true }
            }
        }
          
  }
}
