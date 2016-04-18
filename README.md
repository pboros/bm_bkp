Used for measuring various scenarios with xtrabackup. using this needs configured boto. Results presented in Percona Live 2016 are in the results directory as well as the output of individual commands. The results are reproducible with these scripts.

Usage
=====

Configuration of the aws part is roles/aws/vars/main.yml. Configuration of the backup benchmark part is in roles/backup/vars/main.yml.

Create AWS instance
-------------------
```
ansible-playbook aws_up.yml
```

Configure the AWS instance for the benchmarks
---------------------------------------------
```
ansible-playbook  --private-key=YOUR_ANSIBLE_KEY_HERE -u ubuntu -i inventory_remote remote.yml
```

Tear down AWS instance
----------------------
```
ansible-playbook aws_down.yml
```



