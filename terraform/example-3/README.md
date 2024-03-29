# Azure VM

Create a Virtual Machine in Azure using Terraform

## Create a SSH Key

recomended key name: azure_modulo_linux

~~~
$ ssh-keygen
~~~

## Create and configure a Virtual Machine

### Run Terraform
~~~
$ az login
$ az account set --subscription "Formaciones" # cambiar a subscripcion 'Formaciones'
$ az vm image list-offers -p "Canonical" -l "westeurope" --output table # conocer offers de Linux
$ az vm image list-skus -p "Canonical" -l "westeurope" -f UbuntuServer --output table # conocer skus de Ubuntu
$ terraform init
$ terraform plan
$ terraform apply
$ az network public-ip show -g DEVOPS -n modulo-linux-publicip # conocer ip publica
~~~

### Allow users with password
~~~
$ sudo sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
$ sudo service ssh restart
~~~

### Script to create users
~~~
$ export PUBLIC_IP=<ip>
$ scp -i azure_modulo_linux create_users.sh adminuser@$PUBLIC_IP:/home/adminuser
$ scp -i azure_modulo_linux users.list adminuser@$PUBLIC_IP:/home/adminuser
$ ssh -i azure_modulo_linux adminuser@<ip>
(azure) $ sudo sh create_users.sh
~~~