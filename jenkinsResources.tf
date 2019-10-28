resource "kubernetes_pod" "jenkins_pod" {
  metadata {
    name      = "jenkins"
    namespace = "devops-pet-project"
    labels = {
      App = "jenkins"
    }
  }
  spec {
    volume{
      name = "jenkins-volume"
      persistent_volume_claim{
        claim_name = "jenkins-volume-claim"
      } 
    }
    container {
      image = "${var.jenkins_image}"
      name  = "jenkins"
      volume_mount {
        mount_path = "/var/jenkins_home"
        name       = "jenkins-volume"
      }
      port {
        container_port = 8080
      }
    }
  }
}


resource "kubernetes_service" "jenkins-service" {
  metadata {
    name      = "jenkins-service"
    namespace = "devops-pet-project"
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
  value = "http://localhost:${kubernetes_service.jenkins-service.spec[0].port[0].node_port}"
}
