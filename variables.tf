variable "kbconfig_path" {
  description = "Path to kube config file"
  default     = "~/.kube/config"
}

variable "jenkins_image" {
  description = "Docker jenkins image to deploy"
  default     = "jenkins/jenkins"
}

variable "jenkins_bootstrap" {
  description = "If set to true, a restart of the container will reset it to default config from git repo"
  default     = "False"
}

# if a bootstraping variable is set to true, after mapping local volume, bootstrap with config 
# from git repo (map volume git_repo type and exec a copy). If false, just map local volume.
