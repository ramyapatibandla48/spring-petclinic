pipeline {
    agent {label 'JDK11'}
  
    stages {
        stage('sourcecode'){
            steps {
                git branch: 'main', url: 'https://github.com/ramyapatibandla48/spring-petclinic.git'
            }
        }

        stage('Build')
        {
            steps {
                sh 'mvn clean package'
               
            }
        }

        
    }
}