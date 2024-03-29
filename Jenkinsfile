pipeline {
  agent any 
    stages {
      stage ('Build') {
        steps {
          sh '/opt/maven/bin/mvn clean install'
        }
    }
      stage ('Building Image') {
        steps {
          sh 'docker build -t abc:latest .'
        }
      }
      stage ('Docker Push') {
        steps {
          sh 'docker login -u neelima640 -p Peacock@2127'
          //Before pushing a docker image, we have to tag that image to our private dockerhub.
          sh 'docker tag abc:latest neelima640/abc:latest'
          sh 'docker push neelima640/abc:latest'
        }
      }
      stage ('Removing existing container') {
        when {
                // Skip this stage if the container 'sathvika' does not exist
                expression { return sh(script: 'docker ps -a --format "{{.Names}}" | grep -q "sathvika"', returnStatus: true) == 0 }
            }
            steps {
                sh 'docker stop sathvika || true' // Stop the container if it exists, ignore errors if it doesn't
                sh 'docker rm sathvika || true'   // Remove the container if it exists, ignore errors if it doesn't
            }
        }
      
      stage ('Creating Docker Container') {
        steps {
          sh 'docker run -d -p 8084:8080 --name=sathvika neelima640/abc:latest'
          
        }
      }
     stage('Creating k8s deployment') {
       steps {
        script {
            def deploymentCheck = sh(script: 'kubectl get deployment sathvika-deployment -o name', returnStdout: true, returnStatus: true)
            if (deploymentCheck == 0) {
                // Delete the existing deployment if it exists
                sh 'kubectl delete deployment sathvika-deployment'
            }
        }
        // Apply the new deployment
        withKubeConfig([credentialsId: 'kubeconfig', serverUrl: 'https://192.168.0.107:6443']) {
            sh 'kubectl apply -f deploy.yaml'
        }
    }
}

      
        
    }
}
          
        
        
      
        
    
  

