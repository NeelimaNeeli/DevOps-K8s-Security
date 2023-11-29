pipeline {
  agent any 
  tools {
        maven 'mvn'
    }

  stages {
        
        stage('Build') { 
            steps {
                sh 'maven -B -DskipTests clean package' 
            }
        }
    }
  }

