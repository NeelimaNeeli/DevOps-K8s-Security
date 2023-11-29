pipeline {
  agent any 
  tools { 
      maven '/opt/maven' 
      jdk '/lib/jvm' 
    }

  stages {
        
        stage('Build') { 
            steps {
                sh 'maven -B -DskipTests clean package' 
            }
        }
    }
  }

