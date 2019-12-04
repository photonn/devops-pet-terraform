
resource "kubernetes_pod" "traefik_pod" {
  metadata {
    name      = "traefik"
    namespace = "devops-pet-project"
    labels = {
      App = "traefik"
    }
  }
  spec {
    container {
      image = "traefik"
      name  = "traefik"
      volume_mount {
        mount_path = "${var.docker-socks-path}"
        name       = "traefik-docker-socks"
      }
      port {
        container_port = 80
      }
      port {
        container_port = 8080
      }
      #https://docs.traefik.io/v2.0/reference/static-configuration/cli/
      args = ["--providers.kubernetescrd=true","--log.Level=DEBUG"]
    }
    volume{
      name = "traefik-docker-socks"
      host_path{
        path = "${var.docker-socks-path}" 
      }
    }
  }
}

resource "kubernetes_service" "traefik-service" {
  metadata {
    name      = "traefik-service"
    namespace = "devops-pet-project"
  }
  spec {
    selector = {
      App = "traefik"
    }
    port{
      name = "traefikport"
      port = 80
      target_port = 80
    }
    port{
      name = "traefikadmin"
      port = 8080
      target_port = 8080
    }
    type = "NodePort"
  }
}

