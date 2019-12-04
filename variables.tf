variable "kbconfig_path" {
  description = "Path to kube config file"
  default     = "~/.kube/config"
}

variable "jenkins_image" {
  description = "Docker jenkins image to deploy"
  default     = "jenkins/jenkins"
}

variable "local-storage-class-reclaim-policy" {
  description = "Reclaim policy for the local storage class. Controls if persistent volumes are destroyed or not with terraform destroy"
  default     = "Retain"
}

variable "jenkins-volume-hostpath-path" {
  description = "Path on the VM running K8s to bind the host_path type volume"
  default     = "/host_mnt/c/Users/Miguel_Martin/jenkins_data"
}

variable "jenkins-home-path" {
  description = "Path of the directory holding jenkins files on docker image"
  default     = "/var/jenkins_home"
}

variable "ansible_image" {
  description = "Docker ansible image to deploy"
  default     = "ansible/ansible"
}

variable "docker-socks-path" {
  description = "Docker socks path"
  default     = "/var/run/docker.sock"
}