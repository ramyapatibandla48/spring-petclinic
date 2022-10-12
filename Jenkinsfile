pipeline {
agent {label 'JDK'}
stages{
    stage('Source Code'){
        steps {
            git branch: 'main', url: 'https://github.com/ramyapatibandla48/spring-petclinic.git'
        }
    }
    stage('buid and package') {
        steps {
            withSonarQubeEnv('My SonarQube Server') {
                sh 'mvn clean package sonar:sonar'
              }
           
            
        }
    }
}
}
