pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-app"
        CONTAINER_NAME = "my-app-container"
        HOST_PORT = "8081"
        CONTAINER_PORT = "8081"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/swatikadam15/first_jenkins.git',
                    credentialsId: 'github-token'
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker rm -f $CONTAINER_NAME || true
                docker run -d \
                  --name $CONTAINER_NAME \
                  -p $HOST_PORT:$CONTAINER_PORT \
                  $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Application deployed successfully"
            echo "🌐 Open: http://<VM-IP>:8081"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-app"
        CONTAINER_NAME = "my-app-container"
        HOST_PORT = "8081"
        CONTAINER_PORT = "8081"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/swatikadam15/first_jenkins.git',
                    credentialsId: 'github-token'
            }
        }

        stage('Build Application') {
            steps {
                sh '''
                mvn clean package -DskipTests
                '''
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
                docker rm -f $CONTAINER_NAME || true
                docker run -d \
                  --name $CONTAINER_NAME \
                  -p $HOST_PORT:$CONTAINER_PORT \
                  $IMAGE_NAME
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Application deployed successfully"
            echo "🌐 Access URL: http://<VM-IP>:8081"
        }
        failure {
            echo "❌ Pipeline failed"
        }
    }
}
