pipeline {
 agent any

    stages {
        stage('Clone') {
		steps {
              		  git 'https://github.com/silogwire/Rep_TP.git'
       		 }
	}
        stage('Build') {
                steps {

               		 sh 'mvn clean compile'
       		 }
	}

         stage('Unit Tests') {
                steps {
                         sh 'mvn test'
                }
                post {
                    always {
                         junit 'target/surefire-reports/**/*.xml'
                    }
                }
         }

         stage('Archive des artifacts') {
                steps {
                                  // to add artifacts in jenkins pipeline tab (UI)
                                  archiveArtifacts 'target/*.war'
                         }
                 }

 }

}
