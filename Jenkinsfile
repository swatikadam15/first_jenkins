pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-app"
        CONTAINER_NAME = "my-app-container"
    }

    stages {

        stage('Checkout Code') {
            steps {
            git branch: 'main',
            url: 'https://github.com/swatikadam15/first_jenkins.git',
            credentialsId: 'github-token'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t $IMAGE_NAME .
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
        
                docker run -d --name $CONTAINER_NAME -p 8081:8081 $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Application deployed successfully"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
