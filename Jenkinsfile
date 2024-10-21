pipeline {
    agent any
    tools {
        maven 'maven-3.9.7'
    }
    stages {
        stage ("clean up") {
            steps {
                deleteDir()
                sh "docker system prune -a --volumes -f"
            }
        }
        stage ("Checkout Source Code") {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'pipeline-spring-mysql-credits', url: 'https://github.com/khemiri22/pipeline-spring-mysql.git']])
            }
            
        }
        stage ("Build Jar") {
            steps {
                sh "mvn clean package -DskipTests"
            }
        }
        stage ("Build Docker Imge from Jar") {
            steps {
                sh "docker build -t spring-mysql-test:latest ."
            }
        }
        stage ("Run The Application With Docker Compose") {
            steps {
                sh "docker compose up -d"
            }
        }
    }
}