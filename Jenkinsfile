pipeline {
    agent {
        label 'docker-agent'
    }

    options {
        timestamps()
        disableConcurrentBuilds()
    }
    environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
}

    stages {

        stage('Prepare') {
            steps {
                echo 'Preparing CI pipeline...'
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x app.sh'
                sh 'docker build -t sumedhkakde/jenkins-lab:1.0 .'
                sh 'echo "$DOCKERHUB_CREDENTIALS_PSW" | docker login -u "$DOCKERHUB_CREDENTIALS_USR" --password-stdin'
                sh 'docker push sumedhkakde/jenkins-lab:1.0'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }
stage('Deploy') {
    steps {
        sh 'docker pull sumedhkakde/jenkins-lab:1.0'
        sh 'docker rm -f jenkins-lab-app || true'
        sh 'docker run -d --name jenkins-lab-app sumedhkakde/jenkins-lab:1.0'
    }
}
    }

    post {
        success {
            echo 'CI Pipeline completed successfully!'
        }

        failure {
            echo 'CI Pipeline failed!'
        }
    }
}
