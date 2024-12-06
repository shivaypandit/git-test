pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/shivaypandit/git-test.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t php-app ."
            }
        }

        stage('Run Docker Container') {
            steps {
                sh "docker stop php-app-container || true"
                sh "docker rm php-app-container || true"
                sh "docker run -d --name php-app-container -p 9090:80 php-app"
            }
        }

        stage('Test Deployment') {
            steps {
                sh "curl -f http://localhost:9090 || exit 1"
            }
        }
    }
}
