pipeline {
    agent any
    tools {
        maven 'MAVEN3'
        jdk 'OracleJDK8'
    }
    environment {
        DOCKER_IMAGE = 'harkaurmaan/myapp'
    }
    stages {
        stage('Checkout & Build Maven Project') {
            steps {
                checkout scm
                bat 'mvn clean install'
            }
        }
        stage('Code Coverage (JaCoCo)') {
            steps {
                bat 'mvn jacoco:prepare-agent test jacoco:report'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE}:${env.BUILD_NUMBER} ."
                }
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        bat "docker login --username %DOCKER_USERNAME% --password %DOCKER_PASSWORD%"
                    }
                }
            }
        }
        stage('Docker Push') {
            steps {
                script {
                    bat "docker push ${DOCKER_IMAGE}:${env.BUILD_NUMBER}"
                }
            }
        }
    }
    post {
        always {
            echo 'This will always run'
            // Here you can clean up files, send notifications, etc.
        }
        success {
            echo 'Build was successful!'
            // Actions to perform on success
        }
        failure {
            echo 'Build failed!'
            // Actions to perform on failure
        }
        cleanup {
            // Cleanup actions
            echo 'Performing post-build cleanup'
        }
    }
}
