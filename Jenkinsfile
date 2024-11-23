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
                    // 
                    sh 'docker build . -f Dockerfile -t docker.io/ahmedmaher07/task:v0'
                  
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // استخدام بيانات الاعتماد لتسجيل الدخول ودفع الصورة
                    withCredentials([usernamePassword(credentialsId: 'Docker_hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh 'docker login docker.io -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                        sh 'docker push docker.io/ahmedmaher07/task:v0'
                        sh 'ssh -i "/NTI.pem" ec2-user@ec2-52-73-65-200.compute-1.amazonaws.com'
                        sh 'docker pull docker.io/ahmedmaher07/task:v0'
                        sh 'docker run -d docker.io/ahmedmaher07/task:v0'
                    }
                }
            }
        }
    }
}