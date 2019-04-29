def label = "jenpod"

properties([parameters([choice(choices: ['terraform apply', 'terraform destroy'], description: 'apply', name: 'apply'),
                        choice(choices: ['terraform destroy'], description: 'destroy', name: 'destroy')])])

podTemplate(label: label, containers: [
  containerTemplate(name: 'python3', image: 'python:3', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'terraform', image: 'hashicorp/terraform', command: 'cat', ttyEnabled: true)
])
{

    node(label)
    {
        try {

                stage('Apply Terraform') {
                         if (${params.apply} == 'terraform apply') {
                            sh 'terraform apply -auto-approve -input=false myplan'
                         }
                         else {
                            sh 'terraform destroy -auto-approve -input=false'
                         }

                        //sh 'echo ${params.apply} -auto-approve -input=false myplan'
                        //sh 'terraform apply -auto-approve -input=false myplan'
                    }

                stage('Terraform destroying') {
                        //sh 'echo ${params.apply} -auto-approve -input=false'
                        //sh 'terraform destroy -auto-approve -input=false'
                    }
            }





        }
        catch(err){
            currentBuild.result = 'Failure'
        }
    }
}
