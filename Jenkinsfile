pipeline {
    agent any

    tools {
        jdk 'JDK11'
        maven 'Maven3'
    }

    stages {
        stage('Checkout') {
            steps {
                 git branch: 'main', url: 'https://github.com/NivedithaMalllikarjun/spring-petclinic-devopss.git'
    
            }
        }

        sstage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
                sh 'ls -l target'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }

        stage('Deploy') {
            steps {
        sh '''
           # Kill old app if running
           pkill -f 'spring-petclinic' || true

           # Run the new jar in background on port 9090
           nohup java -jar target/spring-petclinic-3.1.0.jar --server.port=9090 > app.log 2>&1 &
         '''
            }
      }
      
        stage('Docker Push') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub-creds', url: '']) {
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }  
    }
}
