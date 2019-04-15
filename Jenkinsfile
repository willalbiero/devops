def reg = [credentialsId: '', url: 'ec2-18-233-153-17.compute-1.amazonaws.com:5000']

pipeline{
    agent {
        label 'docker'
    }

    environment{
        URL_REGISTRY_DOCKER = 'ec2-18-233-153-17.compute-1.amazonaws.com:5000'
    }
    stages{

        stage("Build Image Container"){
            when{
                anyOf {
                    changeset 'Dockerfile'
                }
            }
            steps{
                withDockerRegistry(reg){
                    sh """
                    docker image build -t "infraascode:${env.BUILD_ID}" . && \
                    docker image push "infraascode:${env.BUILD_ID}"
                    """
                }
//               script{    
//               echo "Rebuilding..."
//                
//                docker.withRegistry("${env.URL_REGISTRY_DOCKER}")
//               def rebuildImage = docker.build("infraascode:${env.BUILD_ID}")
//                rebuildImage.push()                
 //              }    
            }
        }
    }
}