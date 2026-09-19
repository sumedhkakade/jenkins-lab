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
        sh 'KUBECONFIG=/etc/rancher/k3s/jenkins-kubeconfig.yaml kubectl get nodes'
        sh 'KUBECONFIG=/etc/rancher/k3s/jenkins-kubeconfig.yaml kubectl set image deployment/jenkins-lab-app jenkins-lab=sumedhkakde/jenkins-lab:1.0'
        sh 'KUBECONFIG=/etc/rancher/k3s/jenkins-kubeconfig.yaml kubectl rollout status deployment/jenkins-lab-app'
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
