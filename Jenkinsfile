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
            withSonarQubeEnv('SONAR_LATEST') {
                sh  'mvn clean install sonar:sonar'
              }
            
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

   
}
}
