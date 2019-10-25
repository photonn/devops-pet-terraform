# Remember, you have to create a file ~/.kube/config
# with the following content
# provider "kubernetes" {
#    host = "https://localhost:2375"
#    username = "AccountNameWithAccess"
#    password = "GuessMe!"
# }

#terraform init -get=true -get-plugins=true -backend=true -backend-config=~/.kube/config
terraform init -get=true -get-plugins=true -backend=true