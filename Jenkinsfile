pipeline {
    agent {
        label 'docker-agent'
    }

    stages {

        stage('Validate Package') {
            steps {
                sh '''
                    echo "Validating new package..."
                    test -f package/new/version.txt
                    cat package/new/version.txt
                    echo "Package validation successful"
                '''
            }
        }
stage('Deploy Package') {
    steps {
        sh '''
            echo "Starting package upgrade..."
            cp package/new/version.txt package/old/version.txt
            echo "Package upgrade completed"
        '''
    }
}
    }
}
