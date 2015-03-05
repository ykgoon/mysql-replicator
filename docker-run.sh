id=14

docker run -d \
--name=mysql-slave-${id} \
-p 2024:22 \
-e MASTER_HOST="slave-8" \
-e MASTER_SSH_USER="user" \
-e MASTER_MYSQL_PORT="3306" \
-e MASTER_USER="root" \
-e MASTER_PASSWORD="" \
-e SLAVE_PORT="3306" \
-e SLAVE_USER="root" \
-e SLAVE_PASSWORD="" \
-e REPLICANT_USER="slave-${id}" \
-e REPLICANT_PASSWORD="7PGzsiSkAMpP2maZ" \
-e SERVER_ID="${id}" \
-v $pwd:/root \
--link mysql-slave-8:slave-8 \
mysql-replicator
