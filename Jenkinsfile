pipeline {
  agent {
  stages {
        stage('Checkout') {
            steps {
                // Checkout code from version control
                git 'https://github.com/NeelimaNeeli/DevOps-K8s-Security.git'
            }
        }        
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
