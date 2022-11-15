generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform{
  required_providers {
    kubernetes = {
          source  = "hashicorp/kubernetes"
          version = "2.14.0"
    }
  }
}
provider "kubernetes" {
  config_path   = "~/.kube/config"
}
EOF
}
