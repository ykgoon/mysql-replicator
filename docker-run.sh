id=4

docker run -d \
--name=mysql-slave-${id} \
-e MASTER_HOST="slave-2" \
-e MASTER_SSH_USER="root" \
-e MASTER_MYSQL_PORT="3306" \
-e MASTER_USER="root" \
-e MASTER_PASSWORD="" \
-e SLAVE_PORT="3306" \
-e SLAVE_USER="root" \
-e SLAVE_PASSWORD="" \
-e REPLICANT_USER="slave-${id}" \
-e REPLICANT_PASSWORD="7PGzsiSkAMpP2maZ" \
-e SERVER_ID="${id}" \
-v $(pwd)/scripts:/root/scripts \
--link mysql-slave-2:slave-2 \
mysql-replicator
