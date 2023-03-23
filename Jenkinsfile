pipeline {
  agent any
  stages {
    stage('Unit Test') {
      steps {
        sh 'mvn clean test'
      }
    }
    stage('Deploy Standalone') {
      steps {
        sh 'mvn deploy -P standalone'
      }
    }
    // stage('Deploy ARM') {
    //   environment {
    //     ANYPOINT_CREDENTIALS = credentials('tonytawkanypointtrainingcredentials')
    //   }
    //   steps {
    //     sh 'mvn deploy -P arm -Darm.target.name=local-4.3.0-ee -Danypoint.username=${ANYPOINT_CREDENTIALS_USR} -Danypoint.password=${ANYPOINT_CREDENTIALS_PSW}'
    //   }
    // }
    stage('Deploy CloudHub') {
      environment {
        ANYPOINT_CREDENTIALS = credentials('tonytawkanypointtrainingcredentials')
      }
      steps {
        //sh 'mvn deploy -P cloudhub -Dmule.version=4.3.0 -Danypoint.username=${ANYPOINT_CREDENTIALS_USR} -Danypoint.password=${ANYPOINT_CREDENTIALS_PSW}'
        sh 'mvn deploy -DmuleDeploy -Dcloud.env=SANDBOX -DcloudhubAppName=accounts-raml-helloworld -Dmule.version=4.1.4 -Dcloud.user=${ANYPOINT_CREDENTIALS_USR} -Dcloud.password=${ANYPOINT_CREDENTIALS_PSW}'      	
      }
    }
  }
}