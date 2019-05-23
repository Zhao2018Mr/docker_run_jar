# 一、dockerfile 文件如下
```bash
FROM openjdk:8-jre

MAINTAINER zyj
# 新建目录
RUN mkdir /opt/jar/
# 把jar包复制进去
# 需要改为你运行的jar包名称
ADD springboot_demo.jar /opt/jar/

#时区 
RUN echo "Asia/Shanghai" > /etc/timezone

RUN mv /etc/localtime /etc/localtime_bak

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 8080

WORKDIR /opt/

# Launch JAVA
# 需要改为你运行的jar包名称
CMD ["java", "-jar","/opt/jar/springboot_demo.jar"]
```
# 二、使用docker命令打包编译
```bash
docker build -f dockerfile -t zyj/springboot .
```
# 三、运行
```bash
docker run -d -p 8080:8080 --name springboot zyj/springboot 
```
######  如果 提示 
```bash
WARNING: IPv4 forwarding is disabled. Networking will not work.
```
则 在宿主机器上执行以下代码 
```bash
vi /etc/sysctl.conf
#添加 
net.ipv4.ip_forward=1
#重启network服务
systemctl restart network
#查看是否修改成功
sysctl net.ipv4.ip_forward
#如果返回为“net.ipv4.ip_forward = 1”则表示成功了
```

# 四、在网页上就可以打开了

 [http://localhost:8080/](http://localhost:8080/)

# 五、如果要查看日志 
```bash
docker exec -it springboot /bin/bash 

cd /opt/jar/logs/
ls
```
# 六、github地址

 [https://github.com/Zhao2018Mr/docker_run_jar](https://github.com/Zhao2018Mr/docker_run_jar)

# 七、CSDN 地址 

 [https://blog.csdn.net/qq_31807569/article/details/90475094](https://blog.csdn.net/qq_31807569/article/details/90475094)
