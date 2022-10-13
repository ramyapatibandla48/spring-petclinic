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
                sh script: 'mvn clean package sonar:sonar'
              }
            
        }
    }

    stage('Artifactory configuration') {
        steps {
            rtMavenDeployer (
                    id: 'spc-deployer',
                    serverId: 'Artifactory-Server',
                    releaseRepo: 'qtecomm-libs-release-local',
                    snapshotRepo: 'qtecomm-libs-snapshot-local',
            )
        }
    }

   
}
}
