pipeline {
  agent any

  environment {
    AWS_REGION            = 'us-east-1'
  }

  stages {
    stage('Checkout') {
     steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'Cred'
                ]]) {

        git url: 'https://github.com/omkarTap/pipeline.git', branch: 'main'
      }
    }

    stage('Terraform Init') {
      steps {
        sh 'terraform init -input=false'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan -input=false -out=tfplan'
      }
    }

    stage('Terraform Apply') {
      steps {
        input message: 'Approve apply?'
        sh 'terraform apply -input=false tfplan'
      }
    }
  }
}
