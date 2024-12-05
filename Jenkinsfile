pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/shivaypandit/git-test.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t php-app .'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh 'docker stop php-app || true && docker rm php-app || true'
                    sh 'docker run -d --name php-app -p 8080:80 php-app'
                }
            }
        }

        stage('Post-Deployment Check') {
            steps {
                script {
                    sh 'curl -f http://localhost:8080 || exit 1'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
        }
    }
}
