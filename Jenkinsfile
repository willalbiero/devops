pipeline{
    agent any

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
                echo "Building..."
            }
        }
    }
}