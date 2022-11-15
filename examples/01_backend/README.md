# 01_backend
### 两个不同的模块都使用s3作为backend，利用terragrunt将两段重复的s3的backend集中在hcl文件配置中。

### module1：创建命名空间为test-module-ns-1的资源
### module2：创建命名空间为test-module-ns-2的资源

## terragrunt使用步骤
``` json
1 在根目录下添加文件（根目录为模块的上级目录）
cat ./01_backend/terragrunt.hcl
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

2 分别在每个模块下添加hcl文件，内容如下
cat ./01_backend/module1/terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}
```