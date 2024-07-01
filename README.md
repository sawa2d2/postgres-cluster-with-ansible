# postgres-cluster-with-ansible

Provision VMs:
```
terraform init
terraform apply -auto-approve 
```

Install a PosgreSQL cluster:
```
ansible-playbook -i hosts.ini install.yml
```
