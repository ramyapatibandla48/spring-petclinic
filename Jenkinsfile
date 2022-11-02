pipeline {
agent {label 'JDK'}
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

    stage('artifactory'){
        steps{
            rtServer (
                    id: 'Artifactory',
                    url: 'https://artifactoryservertest.jfrog.io',
                    username: 'artifactory',
                    password: 'Artifactory@123', //login for https://artifactoryservertest.jfrog.io/ui/login/
                    bypassProxy: true,
                    timeout: 300
                )
        }
    }

    stage('upload'){
        steps{
            rtUpload (
                    serverId: 'Artifactory',
                    spec: '''{
                        "files": [
                            {
                            "pattern": "target/*.war",
                            "target": "springpetclinic-libs-release-local/"
                            }
                        ]
                    }''',
            )
        }
    }

    stage('Docker build'){
        agent {label 'spcdocker'}
        steps{
                sh 'docker build -t spc . '
        }
    }
}
}


