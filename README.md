# Docker MySQL Replicator

This is an Ubuntu-based container that creates a network MySQL slaves.

## Input required

You need a few items in place before building the container.

- SSH keys to the master; refer [here](http://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/)
for how to generate SSH keys.
 - Copy and rename your private SSH key to `/scripts/keyz` and `/scripts/keyz.pub`

## Build image

`docker build --tag=mysql-replicator .`

## Run container

Open `docker-run.sh` and modify each parameter

- Slave's MySQL server ID (*id*)
- Host address to master
- Master's MySQL credential
- Slave's MySQL credential
- Replicant's credential in master (`keyz`)
- Remove container link if master is not another Docker container

After you're done, run `./docker-run.sh` to create container.

### Start replication

`docker exec -ti [container name] /root/scripts/repstart.sh`

### Check replication

`docker exec -ti [container name] /root/sccripts/repcheck.sh`

## Making this a master

You might have a need to make this slave container a master to other slaves.
Follow these steps:

1. Start SSH service: `docker exec -ti mysql-slave service mysql start`
1. Create a new user in container: `docker exec -ti mysql-slave adduser user`
1. Set password
1. Create new SSH key, authorize it in the new master with `ssh-copy-id`

## Author's note

There are still too many input needed to get this right, hence too many ways
for this to go wrong. Continous refinement is needed to normalize operation
and minimize parameters.

Also, as containers go up and down, connections may break and settings may run
off. They are all fixable, but it means the architecture is fragile.

Further work is needed to make it robust.
