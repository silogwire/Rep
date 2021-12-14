pipeline {
    agent {
        docker {
            image 'maven:3-alpine' 
            args '-v /root/.m2:/root/.m2' 
        }
     }
  environment {
                 SONARQUBE_URL = "http://79.137.37.35"
                 SONARQUBE_PORT = "9000"
                 SONARQUBE_LOGIN = "7feb11a80127b3e132ef98b518d67e4115959d1a"
         }

    stages {
        stage('Clone') {
		steps {
              		  git 'https://github.com/silogwire/Rep.git'
       		 }
	}
        stage('Build') {
                steps {

               		 sh 'mvn  -B -DskipTests clean package'
       		 }
	}

         stage('Tests') {
                steps {
                         sh 'mvn test'
                }
                post {
                    always {
                         junit 'server/target/surefire-reports/*.xml'
                    }
                
        //                 success {
         //                         stash(name: 'artifact', includes: 'server/target/*.jar')
             //                     stash(name: 'pom', includes: 'pom.xml')
                                  // to add artifacts in jenkins pipeline tab (UI)
           //                       archiveArtifacts 'server/target/*.jar'
               //          }
                 }
        }


      stage('Code Quality Analysis') {
              steps {
                      sh 'mvn sonar:sonar -Dsonar.projectKey=sonarqube_Hello \
                                            -Dsonar.host.url=$SONARQUBE_URL:$SONARQUBE_PORT \
                                            -Dsonar.login=$SONARQUBE_LOGIN'
              }
      }

 }

}
