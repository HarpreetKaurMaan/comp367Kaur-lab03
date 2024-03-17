pipeline {
    agent any
    environment {
        // Define your Docker Hub credentials ID here
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build Maven Project') {
            steps {
                // Use 'bat' instead of 'sh' on Windows
                bat 'mvn clean package'
            }
        }
        stage('Code Coverage') {
            steps {
                // Use 'bat' instead of 'sh' on Windows
                bat 'mvn jacoco:report'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    // The 'docker' step typically works on both Unix and Windows without modification
                    dockerImage = docker.build "harkaurmaan/myapp:${env.BUILD_ID}"
                }
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS_ID) {
                        // This will log in to Docker Hub using the credentials stored in Jenkins
                    }
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    // The 'dockerImage.push()' command will work on both Unix and Windows without modification
                    dockerImage.push()
                }
            }
        }
    }
}
