resource "kubernetes_storage_class" "local-storage-class" {
  metadata {
    name = "local-storage-class"
  }
  storage_provisioner = "docker.io/hostpath"
  reclaim_policy      = "Retain"
}