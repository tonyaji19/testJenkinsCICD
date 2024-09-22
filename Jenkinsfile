pipeline {
    agent any

    environment {
        NODE_ENV = 'production'
    }

    stages {
        

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                sh 'npm run build'
            }
        }

        stage('Deploy in Docker Container') {
            steps {
                script {
                    // Hapus container sebelumnya jika ada
                    sh 'docker rm -f my-next-app || true'

                    // Build Docker image
                    sh 'docker build -t my-next-app .'

                    // Jalankan container baru
                    sh 'docker run -d -p 3000:3000 --name my-next-app my-next-app'
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Bersihkan workspace setelah build
        }
        success {
            echo 'Build and deploy successful!'
        }
        failure {
            echo 'Build or deploy failed!'
        }
    }
}
