pipeline {
  agent any
  triggers{
    pollSCM('H/2 * * * *')
  }
  stages {
    stage('Build Application') { 
      steps {
        sh 'mvn clean install'
      }  
    }

	stage('Deploy CloudHub') { 
      environment {
        ANYPOINT_CREDENTIALS = credentials('tonytawkanypointtrainingcredentials')
      }
            
      steps {
        echo 'Deploying only because of code commit...'
        echo 'Deploying to  dev environent....'
        sh 'mvn package deploy -DmuleDeploy -Dusername=${ANYPOINT_CREDENTIALS_USR} -Dpassword=${ANYPOINT_CREDENTIALS_PSW} -DworkerType=Micro -Dworkers=1 -Dregion=us-west-2'
      }
	  
	}
  }
}