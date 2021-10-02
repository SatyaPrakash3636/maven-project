pipeline {
    agent any

    environment {
	DOCKER_PASS = credentials('docker_pass')
    }
    stages {
        stage('Build') {
            steps {
                sh """
		    echo 'Building the JAR and Docker Image'
		    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
		    ./jenkins/build/build.sh
		"""
            }
	    post {
		success {
		    archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
		}
	    }
        }

        stage('Test') {
            steps {
                sh """
		    echo 'Testing the code'
		    ./jenkins/test/mvn.sh mvn test
		"""
            }
	    post {
		always {
		    junit 'java-app/target/surefire-reports/*.xml'
		}
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
