pipeline{
  agent any
  tools{
        maven 'MAVEN3'
    }
    stages{
        stage('Checkout & Build Maven Project') {
            steps{
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
            steps{
                script{
                    bat 'docker build -t harkaurmaan/myapp .'
                }
            }
        }
        stage('Docker Login'){
            steps{
                script{

                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    bat 'docker login --username %DOCKER_USERNAME% --password %DOCKER_PASSWORD%'
                    }
                }
            }
  		}
  		stage('Docker Push'){
            steps{
                script{

                    bat 'docker push harkaurmaan/myapp:latest'
                }
            }
  		}
	}
}
