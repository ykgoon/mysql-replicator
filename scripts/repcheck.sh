#!/bin/bash
mysqlrplcheck  --master=${MASTER_USER}:${MASTER_PASSWORD}@127.0.0.1:3307 --slave=${SLAVE_USER}:${SLAVE_PASSWORD}@localhost:${SLAVE_PORT}
