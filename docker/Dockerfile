FROM alpine:3.9.5
#MAINTAINER Vector

#Add glibc
COPY file /tmp


# Install tzdata tini openssh curl bash | sgerrand.rsa.pub  |glibc*
RUN set -x \
 && apk update \
 && apk --no-cache add tzdata tini openssh curl bash \
 && cd /tmp \
 && mv sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub \
 && apk add glibc-2.25-r0.apk glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk \
# set gosu
  && chmod +x gosu \
  && mv gosu /usr/local/bin \
# set jdk
 && mkdir -p /home/admin/.local/bin \
 && tar xf jre-8u321-linux-x64.tar.gz -C /home/admin/.local/bin \
# Set lang
 && /usr/glibc-compat/bin/localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 \
# Set timezone
 && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
 && echo "Asia/Shanghai" > /etc/timezone \
# Clean 
 && rm -rf /tmp/* 
 
#set env
ENV PATH=$PATH:/home/admin/.local/bin/jre1.8.0_321/bin \
    JAVA_HOME=/home/admin/.local/bin/jre1.8.0_321 \
	JRE_HOME=/home/admin/.local/bin/jre1.8.0_321/jre  \
	CLASSPATH=.:/home/admin/.local/bin/lib:/home/admin/.local/bin/jre1.8.0_321/jre/lib \
	LANG=zh_CN.UTF-8 
	
#export sshd port
#EXPOSE 22

# start ssh
#-D 后台运行，不带执行后，会退出容器
#CMD [ "/usr/sbin/sshd", "-D" ]    
#CMD [ "/usr/sbin/sshd" ] 
