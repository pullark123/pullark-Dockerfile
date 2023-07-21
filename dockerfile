FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install java -y
CMD ["/bin/bash"]
RUN mkdir /tmp/tomcat
WORKDIR /tmp/tomcat
ADD  https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.78.tar.gz
RUN mv apache-tomcat-9.0.78/* /tmp/tomcat
EXPOSE 8080
CMD ["/tmp/tomcat/bin/catalina.sh", "run"]

