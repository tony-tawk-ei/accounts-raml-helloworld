pipeline {
  agent any
  triggers{
    pollSCM('H/2 * * * *')
  }
  stages {
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
        sh 'mvn deploy -DmuleDeploy -Dcloud.env=Training -DcloudhubAppName=accounts-raml-helloworld -Dmule.version=4.3.0 -Dcloud.user=${ANYPOINT_CREDENTIALS_USR} -Dcloud.password=${ANYPOINT_CREDENTIALS_PSW}'      	
      }
    }
  }
}