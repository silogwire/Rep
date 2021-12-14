pipeline {
	agent any 
	environment {
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
                
                        	 success {
                             		 stash(name: 'artifact', includes: 'webapp/target/*.war')
                               		 stash(name: 'pom', includes: 'pom.xml')
                                 	 // to add artifacts in jenkins pipeline tab (UI)
                               		 archiveArtifacts 'webapp/target/*.war'
                    		 }
               		  }
        	}

		stage('Sonarqube') {
			steps {
                		withSonarQubeEnv('sonarqube') {
                     			sh 'mvn clean package sonar:sonar -Dsonar.login=$SONARQUBE_LOGIN'
				}
			}
		}

		stage('Docker Build') {
      			steps {
	      			sh 'docker build -t sihamlogwire/webapp:latest .'
      			 }
 		}
 
		stage('Test Image') {
 			steps {
			 	sh 'docker run -tid -p  8081:8080 webapp:latest'
			 }
		}


		 stage('Docker Push') { 
			steps {
        			withCredentials([usernamePassword(credentialsId:'dockerHub',passwordVariable: 'dockerHubPassword',sernameVariable: 'dockerHubUser')]) {
         				 sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}" 
        			 	sh 'docker push sihamlogwire/webapp:latest'        
   				 } 
			}
		}
	}
}
