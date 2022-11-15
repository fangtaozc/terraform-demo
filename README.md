# 使用terraform工具的demo记录
主要环境是以s3为backend，在kubernets上部署相关服务，并且以terrgrunt为辅助工具。

## [terraform安装](https://developer.hashicorp.com/terraform/downloads)
## [terragrunt安装](https://terragrunt.gruntwork.io/docs/getting-started/install/)



## 主要案例
* [01_backend](https://github.com/fangtaozc/terraform-demo/tree/main/examples/01_backend) 以s3为backend时，可以针对所有模块统一配置，并且将每个模块生成的state文件分别存储到同一个存储桶的不同key中。


* [02_provider](https://github.com/fangtaozc/terraform-demo/tree/main/examples/02_provider) terraform调用provider需要指定版本和相应的配置，不同模块可能会存在相同的部署，通过terragrunt统一化配置。

* [03_parameters](https://github.com/fangtaozc/terraform-demo/tree/main/examples/03_parameters) 模块之间可能会有依赖，并且存在一些参数传递，利用terragrunt可以实现模块的依赖调用顺序，并且传递参数。（terragrunt run-all apply可以实现一次性有序部署多个模块）

