# һ��dockerfile �ļ�����
```bash
FROM openjdk:8-jre

MAINTAINER zyj
# �½�Ŀ¼
RUN mkdir /opt/jar/
# ��jar�����ƽ�ȥ
# ��Ҫ��Ϊ�����е�jar������
ADD springboot_demo.jar /opt/jar/

#ʱ�� 
RUN echo "Asia/Shanghai" > /etc/timezone

RUN mv /etc/localtime /etc/localtime_bak

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 8080

WORKDIR /opt/

# Launch JAVA
# ��Ҫ��Ϊ�����е�jar������
CMD ["java", "-jar","/opt/jar/springboot_demo.jar"]
```
# ����ʹ��docker����������
```bash
docker build -f dockerfile -t zyj/springboot .
```
# ��������
```bash
docker run -d -p 8080:8080 --name springboot zyj/springboot 
```
######  ��� ��ʾ 
```bash
WARNING: IPv4 forwarding is disabled. Networking will not work.
```
�� ������������ִ�����´��� 
```bash
vi /etc/sysctl.conf
#��� 
net.ipv4.ip_forward=1
#����network����
systemctl restart network
#�鿴�Ƿ��޸ĳɹ�
sysctl net.ipv4.ip_forward
#�������Ϊ��net.ipv4.ip_forward = 1�����ʾ�ɹ���
```

# �ġ�����ҳ�ϾͿ��Դ���

 [http://localhost:8080/](http://localhost:8080/)

# �塢���Ҫ�鿴��־ 
```bash
docker exec -it springboot /bin/bash 

cd /opt/jar/logs/
ls
```
# ����github��ַ

 [https://github.com/Zhao2018Mr/docker_run_jar](https://github.com/Zhao2018Mr/docker_run_jar)

# CSDN ��ַ 

 [https://blog.csdn.net/qq_31807569/article/details/90475094](https://blog.csdn.net/qq_31807569/article/details/90475094)