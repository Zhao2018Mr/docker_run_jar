FROM openjdk:8-jre


MAINTAINER zyj


RUN mkdir /opt/jar/

ADD springboot_demo.jar /opt/jar/


#时区 
RUN echo "Asia/Shanghai" > /etc/timezone

RUN mv /etc/localtime /etc/localtime_bak

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime



EXPOSE 8080


WORKDIR /opt/jar/

# Launch JAVA
CMD ["java", "-jar","springboot_demo.jar"]