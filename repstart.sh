#!/bin/bash

echo ---=DUMP/RESTORE MASTER=---
mysqldump -u${MASTER_USER} -p${MASTER_PASSWORD} -P3307 -h127.0.0.1 -q --add-drop-database --add-drop-table -f -A --lock-all-tables | mysql -u${SLAVE_USER} -hlocalhost -p${SLAVE_PASSWORD} -P${SLAVE_PORT} && \

echo ---=CREATING REPLICATION=--- && \
mysqlreplicate --master=${MASTER_USER}:${MASTER_PASSWORD}@127.0.0.1:3307 --slave=${SLAVE_USER}:${SLAVE_PASSWORD}@localhost:${SLAVE_PORT}  --rpl-user=${REPLICANT_USER}:${REPLICANT_PASSWORD} && \

echo ---=TESTING MASTER=--- && \
mysqlrplcheck  --master=${MASTER_USER}:${MASTER_PASSWORD}@127.0.0.1:3307 --slave=${SLAVE_USER}:${SLAVE_PASSWORD}@localhost:${SLAVE_PORT}
