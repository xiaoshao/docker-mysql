FROM centos:centos7

MAINTAINER zwshao1986@gmail.com

WORKDIR /root/

RUN yum install -y wget

RUN wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm

RUN rpm -ivh /root/mysql-community-release-el7-5.noarch.rpm

RUN yum install -y mysql-server

RUN mysql_install_db --user=mysql

ENV MYSQL_USER test

ENV MYSQL_PASSWORD mypqssowrd

ADD import_data.sh /root/import_data.sh

RUN chmod u+x /root/import_data.sh

RUN /root/import_data.sh

ADD startup.sh /root/startup.sh

RUN chmod u+x /root/startup.sh

EXPOSE 3306

CMD /root/startup.sh