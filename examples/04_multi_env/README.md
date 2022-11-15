# 04_multi_env
### 针对多个环境的不同配置，将配置统一进行管理

### module：创建命名空间和configmap，命名空间名称和configmap的value可以通过变量进行设置
### env：配置了两组环境配置，分别设置了不同的命名空间名称和configmap的值

## 使用步骤
### 1 在module中设置变量（便于不同环境输入）
```
variable "module-ns" {
  type = string
  default = "test-module"
}

variable "module-data" {
  type = string
  default = "data-1234"
}
```
### 2 当使用env1环境时
``` sh
terragrunt plan --var-file=../env/env1/namespace.tf --var-file=../env/env1/variables.tfvars

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # kubernetes_config_map_v1.test-config will be created
  + resource "kubernetes_config_map_v1" "test-config" {
      + data = {
          + "test-key" = "data-env1"
        }
      + id   = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "test-config"
          + namespace        = "test-module-env1"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }
    }

  # kubernetes_namespace_v1.module-ns will be created
  + resource "kubernetes_namespace_v1" "module-ns" {
      + id = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "test-module-env1"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────
```

### 3 当使用env2环境时
``` sh
terragrunt plan --var-file=../env/env2/namespace.tf --var-file=../env/env2/variables.tfvars

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # kubernetes_config_map_v1.test-config will be created
  + resource "kubernetes_config_map_v1" "test-config" {
      + data = {
          + "test-key" = "data-env2"
        }
      + id   = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "test-config"
          + namespace        = "test-module-env2"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }
    }

  # kubernetes_namespace_v1.module-ns will be created
  + resource "kubernetes_namespace_v1" "module-ns" {
      + id = (known after apply)

      + metadata {
          + generation       = (known after apply)
          + name             = "test-module-env2"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────
```