= Docker MySQL Replicator =

This is an Ubuntu-based container that creates an instant MySQL slave.

== Input required ==

You need a few items in place before building the container.

- SSH keys to the master; refer [[http://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/ | here]]
for how to generate SSH keys.
 - Copy and rename your private SSH key to `keyz`

== Build image ==

`docker build --tag=mysql-replicator .`

== Run container ==

Open `docker-run.sh` and modify each parameter

- Slave's MySQL server ID (//id//)
- Host address to master
- Master's MySQL credential
- Slave's MySQL credential
- Replicant's credential in master
- Remove container link if master is not another Docker container
- Intended SSH port for slave

After you're done, run `./docker-run.sh` to create container.

=== Start replication ===

`docker exec -ti [container name] /repstart.sh`

=== Check replication ===

`docker exec -ti [container name] /repcheck.sh`

== Making this a master ==

You might have a need to make this slave container a master to other slaves.
Follow these steps:

1. Create a new user in container: `docker exec -ti mysql-slave adduser user`
1. Set password
1. Create new SSH key, authorize it in the new master with `ssh-copy-id`


== Author's note ==

There are still too many input needed to get this right, hence too many ways
for this to go wrong. Continous refinement is needed to normalize operation
and minimize parameters.
