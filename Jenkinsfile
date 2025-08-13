pipeline {
    agent any

    environment {
        IMAGE_NAME = "static-node-app"
        CONTAINER_NAME = "static-node-container"
    }

    stages {
        stage('Install Node.js Dependencies') {
            steps {
                script {
                    echo "Installing Node.js dependencies..."
                    sh 'npm install'
                }
            }
        }

        stage('Build & Deploy to Docker') {
            steps {
                script {
                    echo "Stopping old container if running..."
                    sh """
                    docker stop ${CONTAINER_NAME} || true
                    docker rm ${CONTAINER_NAME} || true
                    """

                    echo "Building Docker image..."
                    sh "docker build -t ${IMAGE_NAME}:latest ."

                    echo "Running new container..."
                    sh "docker run -d --name ${CONTAINER_NAME} -p 3000:3000 ${IMAGE_NAME}:latest"
                }
            }
        }
    }
}
