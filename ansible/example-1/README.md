# Ansible

## Vagrant

1. Create the virtual machine using vagrant

~~~
$ cd vagrant
$ vagrant up
$ vagrant ssh
vagrant@balberith$ ip a
~~~

2. Access virtual machine via ssh

~~~
$ ssh vagrant@<ip>
Password: vagrant
~~~

3. Create ssh key

~~~
$ ssh-keygen
$ ssh-copy-id -i <ssh_key> vagrant@<ip>
$ ssh -i <ssh_key> vagrant@<ip>
~~~

## References

* [Public Vagrant Box Catalog](https://app.vagrantup.com/boxes/search)
* [Vagrant Utility for Mac Apple Silicon](https://developer.hashicorp.com/vagrant/docs/providers/vmware/vagrant-vmware-utility)
* [Vagrant for Mac Apple Silicon](https://medium.com/@iamzamartech/create-and-manage-vms-with-vagrant-on-mac-m1-chip-d8b85eed082e)
* [Jupyterhub installation guide](https://jupyter.org/install)
* [Keycloak installation guide](https://www.keycloak.org/getting-started/getting-started-zip)