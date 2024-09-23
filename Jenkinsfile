pipeline {
    agent any

    tools {
        nodejs 'NodeJS Build' // Sesuaikan dengan nama yang kamu masukkan
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
                    sh 'docker build -t my-next-app .'
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
