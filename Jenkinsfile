pipeline {
    agent any
    tools {
        maven 'maven'
    }
    stages {
        stage ("clean up") {
            steps {
                deleteDir()
                sh "docker system prune -a --volumes -f"
            }
        }
       stage ("Clone repo") {
            steps {
                sh "git clone https://github.com/walid090/back-spring.git"
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
