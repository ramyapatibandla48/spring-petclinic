pipeline {
agent {label 'JDK'}
stages{
    stage('Clone'){
        steps {
            git branch: 'main', url: 'https://github.com/ramyapatibandla48/spring-petclinic.git'
        }
    }
    stage('buid and package') {
        steps {
            withSonarQubeEnv('SONAR_LATEST') {
                    sh script: 'mvn clean package sonar:sonar'
            
        }
    }
}
}