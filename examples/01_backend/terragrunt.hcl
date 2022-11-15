remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "terraform-demo"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "us-east-1"
    endpoint = "http://s3.us-east-1.localhost.localstack.cloud:4566"
    skip_region_validation = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}