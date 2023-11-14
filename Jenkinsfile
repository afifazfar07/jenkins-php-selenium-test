pipeline {
    agent any
    stages {
        stage('Deploy Web Site') {
            steps {
                sh 'chmod +x ./jenkins/scripts/deploy.sh'
                sh './jenkins/scripts/deploy.sh'
            }
        }
        stage('Headless Browser Test') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /root/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn -B -DskipTests clean package'
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Kill Web Site') {
            agent any
            steps {
				input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh 'chmod +x ./jenkins/scripts/kill.sh'
                sh './jenkins/scripts/kill.sh'
            }
        }
    }
}
