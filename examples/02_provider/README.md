# 02_provider
### 两个不同的模块都使用terraform-kubernetes-provider，利用terragrunt将两段重复的provider集中在hcl文件配置中。

### module1：创建命名空间为test-module-ns-1的资源
### module2：创建命名空间为test-module-ns-2的资源

## terragrunt使用步骤
``` json
1 在根目录下添加文件（根目录为模块的上级目录）
cat ./01_backend/terragrunt.hcl
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


2 分别在每个模块下添加hcl文件，内容如下
cat ./01_backend/module1/terragrunt.hcl
include "root" {
  path = find_in_parent_folders()
}
```