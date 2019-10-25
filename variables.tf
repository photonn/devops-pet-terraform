variable "kbconfig_path" {
  description = "Path to kube config file"
  default     = "~/.kube/config"
}

variable "jenkins_image" {
  description = "Docker jenkins image to deploy"
  default     = "jenkins/jenkins"
}