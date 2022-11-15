# 03_parameters
### 模块之间传递参数

### module1：创建命名空间为test-module-ns-1的资源，并输出空间名称
### module2：在module1输出的命名空间中，创建configmap

## terragrunt使用步骤
```
1 定义输出（module1）命名空间

output "module-ns" {
    value = kubernetes_namespace_v1.module-ns.metadata[0].name
}

2 在module2中定义变量（负责接收module1中的输出）

variable "module_ns" {
  type = string
  default = "module-default"
}

3 在module2中的terragrunt.hcl文件中添加依赖，并且将module1中的输出赋值给module2中的变量
dependency "module1" {
  config_path = "../module1"
}
inputs = {
  module_ns = dependency.module1.outputs.module-ns
}

4 调用方式
# 进入根目录 
cd ./03_parameters
# 执行所有部署
terragrunt run-all apply 
```