pipeline {
    agent any
 environment {
        PATH = "$PATH:/opt/maven/bin"
        NEXUS_VERSION = "nexus3"
        NEXUS_PROTOCOL = "http"
        NEXUS_URL = "10.0.2.15:8081"
        NEXUS_REPOSITORY = "jenkins-repo"
        NEXUS_CREDENTIAL_ID = "deploymentRepo"
       // DOCKERHUB_CREDENTIALS = credentials('dockerhub')
	DOCKER_USERNAME = "dockerfilehunter"
   	DOCKER_REGISTRY = ''
        DOCKER_IMAGE_NAME = 'achatproject'
        DOCKER_IMAGE_TAG = 'latest'
    }
   
    stages {
        stage('Checkout') {
            steps {
                // Étape de checkout : récupération du code depuis Git
          git credentialsId: 'token', url: 'https://github.com/DevAzizHub/projetdevops.git'            
    
            }
        }



        stage('Maven') {
            steps {
                // Étape de compilation avec Maven
                sh 'mvn clean install'
            }
        }

        stage('docker build'){
          steps {
             sh 'docker version'
             sh 'docker build -t dockerfilehunter/achat .'
             sh 'docker image list'
            // sh 'docker tag aziz-docker dockerfilehunter/achat:latest'
          } 

 }          
               


 

/*stage('Docker image build'){ 
	steps {
		script {
			sh 'docker image build -t   dockerfilehunter/achatproject .'
			//sh "sudo docker build -t ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ."

              
		}

	}


}*/

     stage("Push to DockerHub") { 
    steps { 
        script {
		 
              sh 'docker image push dockerfilehunter/achat:latest'
            
        }
    } 
}


            
        

/*  stage('Deploy to Nexus') {
            steps {
                sh 'mvn deploy'
            }
        }*/
        
        stage('Affichage de la date système') {
            steps {
                // Étape pour afficher la date système
                script {
                    def date = sh(script: 'date', returnStdout: true).trim()
                    println "Date système : ${date}"
                }
            }
        }
	 stage('Docker compose up') {
      steps {
        sh "docker-compose up -d"
      }
    }
}
}
