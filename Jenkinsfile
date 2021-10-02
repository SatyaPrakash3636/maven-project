pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh """
		    echo 'Building the JAR and Docker Image'
		    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
		    ./jenkins/build/build.sh
		"""
            }
        }

        stage('Test') {
            steps {
                sh """
		    echo 'Testing the code'
		    ./jenkins/test/mvn.sh mvn test
		"""
            }
        }
        
        stage('Push') {
            steps {
                sh """
		    echo 'Uploading image to Docker Hub'
		    ./jenkins/push/push.sh
		"""
            }
        }

        stage('Deploy') {
            steps {
                sh """
		    echo 'Deploying project'
		    ./jenkins/deploy/deploy.sh
		"""
            }
        }
    }
}
