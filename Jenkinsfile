def config = {}
def env = {}

pipeline {
  agent any
  triggers{
    pollSCM('H/2 * * * *')
  }
  stages {
    stage("Configuration setup...") { 
            steps {
                echo "Configuration setup..."
                script {
                    config = readJSON file: "env/${env.BRANCH_NAME}/config.json"
                    env = config.get("envConfig")
                }
            }            
    }

    stage('Unit Test') {
      steps {
        sh 'mvn clean test'
      }
    }

    stage('Deploy CloudHub') {
      environment {
        ANYPOINT_CREDENTIALS = credentials('tonytawkanypointtrainingcredentials')
      }
      steps {
        sh "mvn deploy -DmuleDeploy -Dcloud.env=${env.envName} -DcloudhubAppName=accounts-raml-helloworld -Dmule.version=${env.muleVersion} -Dcloud.user=${ANYPOINT_CREDENTIALS_USR} -Dcloud.password=${ANYPOINT_CREDENTIALS_PSW}"
      }
    }
  }
}