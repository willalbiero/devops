node {
    checkout scm

    docker.withRegistry('ec2-18-233-153-17.compute-1.amazonaws.com:5000') {

        docker.image('infraascode').inside {
            sh 'make test'
        }
    }
}