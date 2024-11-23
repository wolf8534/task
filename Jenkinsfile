pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {  
                git branch: 'main', url: 'https://github.com/wolf8534/task.git' 
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build . -f Dockerfile -t docker.io/ahmedmaher07/task:v0'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'Docker_hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login docker.io -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        sh 'docker push docker.io/ahmedmaher07/task:v0'
                    }
                }
            }
        }
        stage('Deploy to EC2') {
            steps {
                script {
                       sh 'chmod 400 NTI.pem'
                       sh 'ssh -i "NTI.pem"  ec2-user@ec2-52-73-65-200.compute-1.amazonaws.com'
                       sh 'docker pull docker.io/ahmedmaher07/task:v0'
                       sh 'docker run -d --name ahmed -p 3000:3000 docker.io/ahmedmaher07/task:v0'
                }
            }
        }
    }
}
