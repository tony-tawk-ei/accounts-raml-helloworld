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
        //miriam  sh 'mvn package deploy -DmuleDeploy -Dusername=${ANYPOINT_CREDENTIALS_USR} -Dpassword=${ANYPOINT_CREDENTIALS_PSW} -DworkerType=Micro -Dworkers=1 -Dregion=us-west-2'

        //tannous sh 'mvn deploy -DmuleDeploy -Dcloud.env=INT -DcloudhubAppName=mule-cicd-test-dev -Dmule.version=4.1.4 -Dcloud.user=samy_toubal -Dcloud.password=test'      
        sh 'mvn clean deploy -P cloudhub -Dmule.version=3.9.0 -Danypoint.username=${ANYPOINT_CREDENTIALS_USR} -Danypoint.password=${ANYPOINT_CREDENTIALS_PSW}


      }
	  
	}
  }
}