node{
    environment{
        URL_REGISTRY_DOCKER = 'ec2-18-233-153-17.compute-1.amazonaws.com:5000'
    }
        stage("Build Image Container"){
            
            shortCommit = sh(returnStdout: true, script: "git log -n 1 --pretty=format:'%h'").trim()
            
            steps{
                
                docker.withRegistry("${env.URL_REGISTRY_DOCKER}")
                echo "Rebuilding..."
                def rebuildImage = docker.build("infraascode:${env.BUILD_ID}")
                echo "Pushing..."
                rebuildImage.push()                
                
               }    
            }
        }
    }
}