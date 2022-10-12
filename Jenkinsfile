pipeline {
agent {label 'JDK'}
stages{
    stage('Clone'){
        steps {
            git branch: 'main', url: 'https://github.com/ramyapatibandla48/spring-petclinic.git'
        }
    }
    stage('buid') {
        steps {
            sh 'mvn clean package'
        }
    }
}
}