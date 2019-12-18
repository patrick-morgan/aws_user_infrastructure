pipeline {
    agent any
    parameters {
        choice(
            name: 'selection',
            description: 'would you like to apply or destroy the stack?',
            choices: ['apply', 'destroy']
        )
    }
    stages {
        stage('Installation') {
            steps {
                echo "${params.selection}"
                echo "Installing gpg, aws, tf. Gear in for the long haul.. this might be a minute or so :D "
                sh './gpgInstallation.bash'
                sh './awscli.sh'
                sh './privateKeyPull.sh'
                sh './terraformInstallation.bash'
            }
        }
        stage('Init') {
            steps {
                sh './terraform init'
                echo "Initialized backend successfully!"
            }
        }
        stage('Apply') {
            steps {
                    echo "Entering apply block"
                    script {
                        if(params.selection == "apply") {
                            sh 'TF_VAR_pgp_key=$(cat publickey.asc) ./terraform plan -out=myplan'
                            def userInput = input(id: 'apply', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Read the plan above for what will be applied', name: 'confirm'] ])
                            sh 'TF_VAR_pgp_key=$(cat publickey.asc) ./terraform apply -input=false myplan'
                            sh './output.sh'
                        }
                        else {
                            echo "Skipping over this!"
                        }
                    }
            }
        }
        stage('Destroy') {
            steps {
                script {
                    if(params.selection == "destroy") {
                    sh './terraform plan -destroy'
                    def destrInput = input(id: 'destroying', message: 'Would you like to destroy the stack?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'CHECK WHAT YOU ARE DESTROYING ABOVE', name: 'confirm'] ])
                    sh './terraform destroy -input=false -auto-approve'
                    echo "The stack has been destroyed."
                    return
                    }
                    else {
                        echo "I did nothing in the destroy block except print this message. "
                        return
                    }
                }
            }
        }
    }
}