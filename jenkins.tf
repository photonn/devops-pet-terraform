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
        mount_path = "/tmp"
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
    # if a bootstraping variable is set to true, after mapping local volume, bootstrap with config 
    # from git repo (map volume git_repo type and exec a copy jenkins home). If false, just map local volume.
    # exec
    # Arguments
    # command - (Optional) Command is the command line to execute inside the container, the working directory for the command is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.
    # use powershell script to check environment see below
    # check if exists and mount this route as a local volume /host_mnt/c/jenkins_local_data to /var/jenkins_home
    # 
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

