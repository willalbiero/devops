pipeline{
    agent any

    environment{
        URL_REGISTRY_DOCKER = 'http://ec2-18-233-153-17.compute-1.amazonaws.com:5000'
    }
    stages{

        stage("Build Image Container"){
            when{
                anyOf {
                    changeset 'Dockerfile'
                }
            }
            steps{
              
              script { 
                echo "Rebuilding..."
                def rebuildImage = docker.build("infraascode:${env.BUILD_ID}")
                echo "Pushing..."
                
                sh """

                docker tag infraascode:${env.BUILD_ID} ec2-18-233-153-17.compute-1.amazonaws.com:5000/infraascode:${env.BUILD_ID} ;
                docker push ec2-18-233-153-17.compute-1.amazonaws.com:5000/infraascode:${env.BUILD_ID}

                """
               }    
            }
        }
    }
}