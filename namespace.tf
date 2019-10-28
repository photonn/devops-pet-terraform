resource "kubernetes_namespace" "devops-pet-project" {
  metadata {
    annotations = {
      name = "devops-pet-project"
    }

    labels = {
      mylabel = "devops-pet-project"
    }

    name = "devops-pet-project"
  }
}