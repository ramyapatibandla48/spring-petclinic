pipeline {
agent {label 'JDK11'}
environment{
        
        registry = "spclinicregistrys/spring-pet-clinic"
        registryCredential = 'dockerhub'        
    }
    
stages{

    stage('Source Code'){
        steps {
            git branch: 'main', url: 'https://github.com/ramyapatibandla48/spring-petclinic.git'
        }
    }
    stage('Buid and sonarqube analysis'){
        steps{  
            withSonarQubeEnv('SONAR_LATEST') {

            sh 'mvn  package sonar:sonar'
        }
    }
    }

   
       stage('Building image') {
       
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    


}
}


