pipeline {
    agent any
    
    stages {
        stage('Build Code') {
            steps {
                sh '/opt/maven/bin/mvn clean package -DskipTests=true'
            }
        }
        stage('Publish Code') {
            steps {
                script {
                    def scannerHome = tool name: 'sonarqube', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
                    withSonarQubeEnv('SonarQube') {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                    
                    // Retrieve the analysis ID from SonarQube
                    def analysisId = sh script: "curl -s 'http://172.17.0.2:9000/api/ce/task?id=devops' -u sqp_399c4c54f8a8183b8fb83869afd1bb5fcac612be:", returnStdout: true
                    analysisId = analysisId.trim()
                    
                    // Wait for the Quality Gate using the retrieved analysis ID
                    timeout(time: 5, unit: 'MINUTES') {
                        script {
                            def qg = waitForQualityGate(analysisId: analysisId)
                            if (qg.status != 'OK') {
                                error "Pipeline aborted due to a quality gate failure: ${qg.status}"
                            }
                        }
                    }
                }
            }
        }
    }
}
