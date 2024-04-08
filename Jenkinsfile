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
          // stage("sonar_quality_check"){
          //  steps{
            //    script{
               //     withSonarQubeEnv(credentialsId: 'adafa76b-6205-41ed-9149-55f48920347e') {
                 //     sh "mvn sonar:sonar"
                   // }

                //     timeout(time: 1, unit: 'HOURS') {
                  //    def qg = waitForQualityGate()
                    //  if (qg.status != 'OK') {
                      //     error "Pipeline aborted due to quality gate failure: ${qg.status}"
                    //  }
                  //  }
              //  }
           // }
          
        //}    
            
 //        stage("Publish to Nexus Repository Manager") {
//            steps {
  //              script {
     //               pom = readMavenPom file: "pom.xml";
   //                 filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
     //               echo "${filesByGlob[0].name} ${filesByGlob[0].path} ${filesByGlob[0].directory} ${filesByGlob[0].length} ${filesByGlob[0].lastModified}"
    //                artifactPath = filesByGlob[0].path;
    //                artifactExists = fileExists artifactPath;
    //                if(artifactExists) {
    //                    echo "* File: ${artifactPath}, group: ${pom.groupId}, packaging: ${pom.packaging}, version ${pom.version}";
     //                   nexusArtifactUploader(
     //                       nexusVersion: NEXUS_VERSION,
      //                      protocol: NEXUS_PROTOCOL,
      //                      nexusUrl: NEXUS_URL,
      //                      groupId: pom.groupId,
        //                    version: pom.version,
        //                    repository: NEXUS_REPOSITORY,
        //                    credentialsId: NEXUS_CREDENTIAL_ID,
         //                   artifacts: [
         //                       [artifactId: pom.artifactId,
           //                     classifier: '',
          //                      file: artifactPath,
           //                     type: pom.packaging],
            //                    [artifactId: pom.artifactId,
            //                    classifier: '',
            //                    file: "pom.xml",
            //                    type: "pom"]
             //               ]
             //           );
             //       } else {
             //           error "* File: ${artifactPath}, could not be found";
             //       }
             //   }
           // }
     //   }

        stage('Affichage de la date système') {
            steps {
                // Étape pour afficher la date système
                script {
                    def date = sh(script: 'date', returnStdout: true).trim()
                    println "Date système : ${date}"
                }
            }
        }
	stage('Docker compose'){
          steps {
            sh 'docker-compose up -d' 
              }}}

}
