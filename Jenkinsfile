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

 }

}
