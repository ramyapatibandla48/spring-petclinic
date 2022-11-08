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
    stage('Buid '){
        steps{  
             

            sh 'mvn  package '
        
    }
    }

   
       stage('Building image') {
       
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    

    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( 'https://spclinicregistrys.azurecr.io', registryCredential )  {
            dockerImage.push()
          }
        }

      }
    }

}
}


