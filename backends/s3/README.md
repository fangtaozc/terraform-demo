## 一、localstack简介
### 1、功能简介
LocalStack 是一个功能齐全的本地 AWS 云堆栈，在离线状态下开发和测试你的云和无服务器应用程序。
为开发云应用程序提供了一个易于使用的测试 / 模拟框架。它在你的本地机器上启动一个测试环境，提供与真正的 AWS 云环境相同的功能和 API。
### 2、相关链接
Github地址: https://github.com/localstack/localstack

官方使用文档：https://docs.localstack.cloud/overview/

docker镜像链接：https://hub.docker.com/r/localstack/localstack
## 二、环境搭建
### 1、准备工作
docker环境（v1.17+）

准备镜像，根据docker镜像链接拉取对应版本的镜像，版本为1.2.0+

linux/arm64/v8： docker pull localstack/localstack:1.2.0

linux/amd64/v8： docker pull localstack/localstack:1.2.0-arm64
``` bash
指定代码
# docker run -d -p 8080:8080 -p 4560-4582:4560-4582 --name localstack -e LOCALSTACK_API_KEY=1kDcEI4IXA -e ENFORCE_IAM=1 -e SERVICES='s3,dynamodb,iam,kms' -e S3_DIR='/tmp/localstack/s3-buckets' localstack/localstack:1.2.0-arm64

参数说明
-p 8080:8080 							AWS的web端口
-p 4560-4582:4560-4582 					各种服务对应的端口‘
-e LOCALSTACK_API_KEY=1kDcEI4IXA 		这是官方的密钥，需要去官网申请（需要购买，有14天试用），如果没有就无法使用一些功能，只能使用基础功能，比如没有IAM功能
-e SERVICES='s3,dynamodb,iam,kms' 		开启哪些功能
-e S3_DIR='/tmp/localstack/s3-buckets'	s3文件的存储目录，如果没有挂载卷，容器删除数据会丢失，测试时需注意！！！

启动成功基础环境后，查看日志
# docker logs -f localstack
Waiting for all LocalStack services to be ready
2022-11-02 07:32:53,925 CRIT Supervisor is running as root.  Privileges were not dropped because no user is specified in the config file.  If you intend to run as root, you can set user=root in the config file to avoid this message.
2022-11-02 07:32:53,926 INFO supervisord started with pid 16
2022-11-02 07:32:54,931 INFO spawned: 'infra' with pid 21
SERVICES variable is ignored if EAGER_SERVICE_LOADING=0.

LocalStack version: 1.2.0
LocalStack build date: 2022-10-07
LocalStack build git hash: 9be2a7aa

2022-11-02 07:32:56,869 INFO success: infra entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2022-11-02T07:32:58.905  INFO --- [  MainThread] l.bootstrap.licensing      : Successfully activated API key
2022-11-02T07:33:00.011  INFO --- [  MainThread] l.extensions.platform      : loaded 0 extensions
2022-11-02T07:33:00.011  INFO --- [  MainThread] l.u.aws.metadata_service   : Starting AWS instance metadata service on port 80
2022-11-02T07:33:00.018  INFO --- [  MainThread] botocore.credentials       : Found credentials in environment variables.
Starting DNS servers (tcp/udp port 53 on 0.0.0.0)...
2022-11-02T07:33:00.412  WARN --- [  Thread-112] hypercorn.error            : ASGI Framework Lifespan error, continuing without Lifespan support
2022-11-02T07:33:00.412  WARN --- [  Thread-112] hypercorn.error            : ASGI Framework Lifespan error, continuing without Lifespan support
2022-11-02T07:33:00.414  INFO --- [  Thread-112] hypercorn.error            : Running on https://0.0.0.0:4566 (CTRL + C to quit)
2022-11-02T07:33:00.414  INFO --- [  Thread-112] hypercorn.error            : Running on https://0.0.0.0:4566 (CTRL + C to quit)
2022-11-02T07:33:00.418  WARN --- [  Thread-114] hypercorn.error            : ASGI Framework Lifespan error, continuing without Lifespan support
2022-11-02T07:33:00.418  WARN --- [  Thread-114] hypercorn.error            : ASGI Framework Lifespan error, continuing without Lifespan support
2022-11-02T07:33:00.418  INFO --- [  Thread-114] hypercorn.error            : Running on https://0.0.0.0:443 (CTRL + C to quit)
2022-11-02T07:33:00.418  INFO --- [  Thread-114] hypercorn.error            : Running on https://0.0.0.0:443 (CTRL + C to quit)
Ready.
```