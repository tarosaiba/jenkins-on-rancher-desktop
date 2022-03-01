pipeline {
  agent {
    kubernetes {
      yamlFile 'jenkins-pod.yaml'
    }

  }
  stages {
    stage('Build') {
      steps {
        container(name: 'kaniko') {
          sh "ls"
        }

      }
    }

    stage('Test') {
      steps {
        container(name: 'kustomize') {
          sh """
                      set +e
                      kubectl create namespace $PROJECT-${env.BRANCH_NAME.toLowerCase()}
                      set -e
                    """
          sh "kubectl run nginx --image=nginx --replicas=5"
          sh "kubectl get pods"
          sh "kubectl delete namespace $PROJECT-${env.BRANCH_NAME.toLowerCase()}"
        }

      }
    }
  }
  environment {
    PROJECT = 'jenkins-demo'
  }
}
