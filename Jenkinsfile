pipeline {
agent {label 'JDK'}
stages{
    stage('Source Code'){
        steps {
            git branch: 'main', url: 'https://github.com/ramyapatibandla48/spring-petclinic.git'
        }
    }
    

    stage('Artifactory configuration') {
        steps {
            rtMavenDeployer (
                    id: 'Artifactory-1',
                    serverId: 'Artifactory-Server',
                    releaseRepo: 'libs-release-local',
                    snapshotRepo: 'libs-snapshot-local',
            )
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
}
