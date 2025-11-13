pipeline {
    agent any

    stages {
        stage('Cloning Git') {
            steps {
                echo "=== Cloning repository ==="
                git branch: 'main', url: 'https://github.com/YoussoufHard/tp4Devops.git'
            }
        }

        stage('Building Image') {
            steps {
                echo "=== Building Docker Image ==="
                bat 'docker build -t youssouftangara/tp4devops:latest .'
            }
        }

        stage('Test Image') {
            steps {
                echo "=== Testing Docker Image ==="
                bat 'docker run --rm youssouftangara/tp4devops:latest nginx -t'
            }
        }

        stage('Publish Image') {
            steps {
                echo "=== Publishing Image to Docker Hub ==="
                bat """
                    echo %DOCKERHUB_TOKEN% | docker login -u youssouftangara --password-stdin
                    docker push youssouftangara/tp4devops:latest
                """
            }
        }

        stage('Deploy Image') {
            steps {
                echo "=== Deploying Docker Container ==="
                bat """
                    docker rm -f tp4devops || echo Container not found
                    docker run -d --name tp4devops -p 8080:80 youssouftangara/tp4devops:latest
                """
            }
        }
    }
}
