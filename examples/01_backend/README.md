# 01 backend
### 两个不同的模块都使用s3作为backend，利用terragrunt将两段重复的s3的backend集中在hcl文件配置中。

## module1：创建命名空间为test-module1的资源
## module2：创建命名空间为test-module2的资源