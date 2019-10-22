pipeline {
    agent any
    tools { nodejs "nodejs" }

    environment {
        PORT = 8090
    }

    stages {
        stage('build') {
            steps {
                sh """
                    npm i -g npm@6.4.1
                    rm -rf node_modules
                    npm ci --only=production
                    sudo mysql -e "source ./BDD/init.d/1-BDD-Badgeuse-tables.sql"
                    sudo mysql -e "source ./BDD/init.d/2-BDD-Badgeuse-Data.sql"
                    pm2 stop all
                    pm2 stop all
                    export PORT=$PORT
                    pm2 start index.js --name badgeuse
                    """
            }
        }
        stage('test') {
            steps {
                sh """
                    export PORT=$PORT
                    npm test
                    npm run test-nyc
                    npm run report-coverage
                    """
            }
        }
        stage('quality') {
            steps {
                sh 'sonar-scanner'
            }
        }
        stage('deploy') {
            steps {
            sh """
            if git config remote.heroku.url > /dev/null; then
              git remote add heroku https://git.heroku.com/badgeuse-intelligente.git
            fi
            git add .
            git commit -m "Initial commit"
            git push heroku master
            """
            }
        }
    }
}