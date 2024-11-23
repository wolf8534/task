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
                   withCredentials([sshUserPrivateKey(credentialsId: 'ec2-user', keyFileVariable: 'PRIVATE_KEY_PATH', usernameVariable: 'SSH_USER')]) {
                       sh 'ssh -i "$PRIVATE_KEY_PATH" $SSH_USER@ec2-52-73-65-200.compute-1.amazonaws.com'
                       sh 'docker pull docker.io/ahmedmaher07/task:v0'
                       sh 'docker run -d docker.io/ahmedmaher07/task:v0'
                    }
                }
            }
        }
    }
}
