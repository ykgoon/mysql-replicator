#!/bin/bash
sed -i -e "s/replacewithid/${SERVER_ID}/g" /etc/mysql/my.cnf

 [ ! -d /var/lib/mysql/mysql ]; 
    chown mysql:mysql /var/lib/mysql
    mysql_install_db


if [ ! -d /etc/ssl/stunnel ]
then
        mkdir /etc/ssl/stunnel
fi

echo "-- Creating SSH tunnel to master --"
ssh -L 3307:localhost:${MASTER_MYSQL_PORT} ${MASTER_SSH_USER}@${MASTER_HOST} -N  -i '/root/scripts/keyz' -o StrictHostKeyChecking=no &

echo "-- Set up replicant user on master --"
trap "mysqladmin shutdown" TERM
mysqld_safe --bind-address=0.0.0.0  --port=${SLAVE_PORT} & 
 sleep 5 &&
 mysql -h 127.0.0.1 -P 3307 -u${MASTER_USER} -p${MASTER_PASSWORD} -e "grant all on *.* to ${REPLICANT_USER}@'%' IDENTIFIED BY '${REPLICANT_PASSWORD}' with grant option;"
wait
