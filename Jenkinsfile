pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "tonyaji19/cicdjenkins:${env.BUILD_ID}" // Atau bisa menggunakan SHA dari GitHub
    }

    stages {
        stage('Deploy in Docker Container') {
            steps {
                script {
                    // Stop and remove old container if exists
                    sh 'docker stop my-next-app || true && docker rm my-next-app || true'

                    // Pull the latest image from Docker Hub
                    sh "docker pull ${DOCKER_IMAGE}"

                    // Run the new container
                    sh 'docker run -d -p 3000:3000 --name my-next-app ${DOCKER_IMAGE}'
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Bersihkan workspace setelah deployment
        }
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
