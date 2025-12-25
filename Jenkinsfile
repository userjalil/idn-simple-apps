pipeline {
    agent { label 'dev' }

    stages {
        stage('Pull SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/userjalil/idn-simple-apps.git'
            }
        }
        
        stage('Build') {
            steps {
                sh'''
                cd app
                npm install
                '''
            }
        }
        
        stage('Testing') {
            steps {
                sh'''
                cd app
                APP_PORT=5001 npm test
                '''
            }
        }
        
        stage('Code Review') {
            steps {
                sh'''
                cd app
                sonar-scanner \
                    -Dsonar.projectKey=idn-simple-apps \
                    -Dsonar.sources=. \
                    -Dsonar.host.url=http://172.23.2.126:9000 \
                    -Dsonar.token=sqp_2d28b0b21de66f0f341a05341968ff847bf6f71a
                '''
            }
        }
        
        stage('Deploy') {
            steps {
                sh'''
                docker compose up --build -d
                '''
            }
        }
                
    }
}