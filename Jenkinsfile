pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh echo 'Building the JAR and Docker Image'
		sh ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
		sh ./jenkins/build/build.sh
            }
        }

        stage('Test') {
            steps {
                sh echo 'Testing the code'
		sh ./jenkins/test/mvn.sh mvn test
            }
        }
        
        stage('Push') {
            steps {
                sh echo 'Uploading image to Docker Hub'
		sh ./jenkins/push/push.sh
            }
        }

        stage('Deploy') {
            steps {
                sh echo 'Deploying project'
		sh ./jenkins/deploy/deploy.sh
            }
        }
    }
}
