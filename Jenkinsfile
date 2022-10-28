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
                    url: 'https://13.69.187.248:8081/artifactory',
                    username: 'jenkins',
                    password: '121FA07048@1',
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
                            "pattern": "*.jar",
                            "target": "https://13.69.187.248:8081/artifactory/libs-release-local/"
                            }
                        ]
                    }''',
            )
        }
    }
}
}


