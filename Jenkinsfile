pipeline {
    agent {
        label 'docker-agent'
    }

    options {
        timestamps()
        disableConcurrentBuilds()
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
                sh './app.sh'
                sh 'docker build -t sumedhkakde/jenkins-lab:1.0 .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
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
