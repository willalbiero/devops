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
                    expression {
                        return currentBuild.number == 1
                    }
                }
            }
            steps{
                echo "Building..."
            }
        }
    }
}