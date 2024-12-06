pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/shivaypandit/git-test.git'
            }
        }

        stage('Validate Code') {
            steps {
                sh 'php -l index.php'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t php-app ."
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker stop php-app-container || true"
                    sh "docker rm php-app-container || true"
                    sh "docker run -d --name php-app-container -p 9090:80 php-app"
                }
            }
        }

        stage('Health Check') {
            steps {
                sh "curl -f http://localhost:9090 || exit 1"
            }
        }
    }

    post {
        success {
            script {
                slackSend(channel: '#ci-cd', message: '✅ Build succeeded for PHP App!')
            }
        }
        failure {
            script {
                slackSend(channel: '#ci-cd', message: '❌ Build failed for PHP App!')
            }
        }
    }
}
