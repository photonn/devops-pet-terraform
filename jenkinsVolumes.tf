resource "kubernetes_persistent_volume_claim" "jenkins-volume-claim" {
  metadata {
    name      = "jenkins-volume-claim"
    namespace = "devops-pet-project"
  }
  spec {
    access_modes       = ["ReadWriteMany"]
    storage_class_name = "local-storage-class"
    resources {
      requests = {
        storage = "4Gi"
      }
    }
    volume_name = "jenkins-volume"
  }
}

resource "kubernetes_persistent_volume" "jenkins-volume" {
  metadata {
    name = "jenkins-volume"
  }
  spec {
    capacity = {
      storage = "4Gi"
    }
    access_modes       = ["ReadWriteMany"]
    storage_class_name = "local-storage-class"
    persistent_volume_source {
      host_path {
        path = "${var.jenkins-volume-hostpath-path}"
      }
    }
  }
}