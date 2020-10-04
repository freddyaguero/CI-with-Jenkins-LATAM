pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Construyendo..'
            }
        }
        stage('Test') {
            steps {
                echo 'Ejecutando test cases..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Desplegando proyecto....'
            }
        }
  
        stage('Upload war to nexus') {
            steps {
                def pom = readMavenPom file: 'pom.xml';
                echo 'Saca nombre artefacto....';
                echo '${pom.artifactId}';    
                echo '${pom.version}'; 
                echo '${pom.packaging}';
                nexusArtifactUploader artifacts: 
                    [[artifactId: 'proj3', 
                      classifier: '', 
                      file: "target/${pom.artifactId}-${pom.version}.${pom.packaging}", 
                      type: 'war'
                     ]], 
                      credentialsId: 'nexus3', 
                    groupId: 'ci.jenkins.aws', 
                    nexusUrl: '34.95.251.107:8081', 
                    nexusVersion: 'nexus3', 
                    protocol: 'http', 
                    repository: 'CIwithJenkinsLATAM', 
                    version: '1.0-RAMA'
                  
            }
        }
       
    }
}
