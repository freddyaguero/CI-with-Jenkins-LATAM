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
        tools{
            maven "Maven 3.6.0"
        }    
        stage('Upload war to nexus') {
            steps {
                script{
                    pom = readMavenPom file: "pom.xml";
                    filesByGlob = findFiles(glob: "target/*.${pom.packaging}");
                    echo "${filesByGlob}";
                    artifactPath = filesByGlob[0].path;
                    echo "artifactPath: ${artifactPath}";
                    
                nexusArtifactUploader artifacts: [
                                                    [artifactId: pom.artifactId,
                                                     classifier: '',
                                                     file: artifactPath,
                                                     type: pom.packaging]
                                                 ], 
                                    credentialsId: 'nexus3', 
                                    groupId: pom.groupId, 
                                    nexusUrl: '34.95.251.107:8081', 
                                    nexusVersion: 'nexus3', 
                                    protocol: 'http', 
                                    repository: 'CIwithJenkinsLATAM', 
                                    version: pom.version
                }    
            }
        }
       
    }
}
