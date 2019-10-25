resource "kubernetes_pod" "jenkins_pod" {
  metadata {
    name = "jenkins"
    labels = {
      App = "jenkins"
    }
  }
  spec {
    container {
      image = "${var.jenkins_image}"
      name  = "jenkins"
      volume_mount {
        mount_path = "/tmp/jenkins-volume"
        name       = "jenkins-volume"
      }
      port {
        container_port = 8080
      }
    }
    volume {
      name = "jenkins-volume"
      git_repo {
        repository = "https://github.com/photonn/devops-pet-jenkins.git"
      }
    }
    #with an exec, move specifc files from cloned repository to /var/jenkins_home and restart jenkins service
  }
}

resource "kubernetes_service" "jenkins_service" {
  metadata {
    name = "jenkins"
  }
  spec {
    selector = {
      App = "jenkins"
    }
    port {
      port        = 8080
      target_port = 8080
    }
    type = "NodePort"
  }
}

output "connection_point" {
  value = "http://localhost:${kubernetes_service.jenkins_service.spec[0].port[0].node_port}"
}

