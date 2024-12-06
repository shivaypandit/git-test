pipeline {
    agent any

    environment {
        IMAGE_NAME = 'php-app'
        CONTAINER_NAME = 'php-app-container'
        PORT = '9090'  // Updated port
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/shivaypandit/git-test.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any existing container
                    sh "docker stop ${CONTAINER_NAME} || true"
                    sh "docker rm ${CONTAINER_NAME} || true"
                    
                    // Start the new container on updated port
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT}:80 ${IMAGE_NAME}"
                }
            }
        }

        stage('Test Deployment') {
            steps {
                script {
                    // Perform a simple test using curl
                    sh "curl -f http://localhost:${PORT} || exit 1"
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs for details.'
        }
    }
}
