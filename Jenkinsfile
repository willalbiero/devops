pipeline{
    agent any

    environment{
        URL_REGISTRY_DOCKER = 'ec2-18-233-153-17.compute-1.amazonaws.com:5000'
    }
    stages{
        stage("Checkout"){
            steps{
                checkout scm
            }
        }

        stage("Build Image Container"){
            when{
                anyOf {
                    changeset 'Dockerfile'
                }
            }
            steps{
                echo "Rebuilding..."
                script {
                docker.withRegistry("${env.URL_REGISTRY_DOCKER}")
                def rebuildImage = docker.build("infraascode:${env.BUILD_ID}")

                rebuildImage.push()                
                }
            }
        }
    }
}