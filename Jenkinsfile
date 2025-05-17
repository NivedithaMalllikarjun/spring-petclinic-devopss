pipeline {
    agent any

    tools {
        maven 'Maven 3.8.6'
        jdk 'JDK11
'
    }

    stages {
        stage('Build') {
            steps {
                sh './mvnw clean package -DskipTests'
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }
}
i
