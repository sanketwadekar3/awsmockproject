pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello there, Starting the pipeline!'
            }
        }
        stage('cleanup') {
            steps {
                echo "cleaning up"
                cleanWs()
            }
        }
        stage('Check out SCM') {
            steps {
                echo "checkingout"
                checkout scm
            }
        }
        stage('terraform_environment') {
            steps {
                sh '''
                    echo 'installing terraform'
                    sudo apt update
                    sudo apt install unzip
                    wget https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip
                    unzip terraform_0.13.0_linux_amd64.zip
                    sudo mv terraform /usr/local/bin/ && rm terraform_0.13.0_linux_amd64.zip
                    terraform --version
                    '''

            }
        }
        stage('build') {
            steps {
                sh '''
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                    terraform destroy
                    '''
            }
        }
}
}
