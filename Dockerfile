FROM ubuntu:trusty

MAINTAINER YK Goon <ykgoon@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update\
    && apt-get install -y mysql-server \
    && apt-get install -y mysql-utilities \
    && apt-get install -y ssh \
    && apt-get install -y mc \
    && rm -rf /var/lib/mysql

ADD my.cnf /etc/mysql/
ADD scripts/start.sh /root

CMD [ "/root/start.sh" ]