
pipeline {
    agent any
    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Destroy Terraform build?')

    }
//      environment {
//         withCredentials([[
//             $class: 'AmazonWebServicesCredentialsBinding',
//             credentialsId: "AWSACCESS_ID",
//             accessKeyVariable: 'AWS_ACCESS_KEY_ID',
//             secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
//             ]])
//     }
    stages {
        stage('checkout') {
            steps {
              checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/askossivi/TheHive-Deployment.git']]])
                }
            }
        stage('Plan') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            steps {
                sh 'terraform init -input=false'
                sh 'terraform workspace select ${environment} || terraform workspace new ${environment}'

                sh "terraform plan -input=false -out tfplan "
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
               not {
                    equals expected: true, actual: params.destroy
                }
           }
           steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }
        stage('Apply') {
            when {
                not {
                    equals expected: true, actual: params.destroy
                }
            }
            steps {
                sh "terraform apply -input=false tfplan"
            }
        }
        stage('Destroy') {
            when {
                equals expected: true, actual: params.destroy
            }
        steps {
           sh "terraform destroy --auto-approve"
        }
    }
  }
}





//Missing AWS Cred



// pipeline {
//     agent any

//     stages {
//         stage('Checkout') {
//             steps {
//             checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/askossivi/TheHive-Deployment.git']]])            

//           }
//         }

//        stage('aws') {
//             steps {
//                 withCredentials([[
//                     $class: 'AmazonWebServicesCredentialsBinding',
//                     credentialsId: "AWSACCESS_ID",
//                     accessKeyVariable: 'AWS_ACCESS_KEY_ID',
//                     secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
//                 ]])
//             } 
//         stage ("terraform init") {
//             steps {
//                 sh ('terraform init') 
//             }
//         }
//         stage ("terraform Action") {
//             steps {
//                 echo "Terraform action is --> ${action}"
//                 sh ('terraform ${action} --auto-approve') 
//            }
//         }
//     }
// }






// pipeline {
//     agent any

//     stages {
//         stage('Checkout') {
//             steps {
//             checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/askossivi/TheHive-Deployment.git']]])            

//           }
//         }

//         withCredentials([[
//             $class: 'AmazonWebServicesCredentialsBinding',
//             credentialsId: "credentials-id-here",
//             accessKeyVariable: 'AWS_ACCESS_KEY_ID',
//             secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
//         ]]) {
//         stage ("terraform init") {
//             steps {
//                 sh ('terraform init') 
//             }
//         }
        
//         stage ("terraform Action") {
//             steps {
//                 echo "Terraform action is --> ${action}"
//                 sh ('terraform ${action} --auto-approve') 
//            }
//          }
//         }
//     }

// }







