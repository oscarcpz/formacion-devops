# Docker for Ansible

~~~
$ docker build -t ansible_img .
$ docker run -it --name ansible -v $PWD:/tmp --rm ansible_img /bin/bash
~~~

## Examples

### First commands

~~~
$ ansible all -i inventory-local -a "whoami"
~~~

~~~
$ ansible all -i inventory-local -a "ls"
~~~

### Gather Facts

~~~
$ ansible all -i inventory-local -m ansible.builtin.gather_facts --tree /tmp/facts
~~~

~~~
$ ansible-playbook -i inventory-local example-0.1.yml
~~~

~~~
$ ansible-playbook -i inventory-local example-0.2.yml
~~~

### First module - File

#### Create a directory

~~~
$ ansible-playbook -i inventory-local example-0.3.yml
~~~

Test run the command twice.

#### Remove directory

~~~
$ ansible-playbook -i inventory-local example-0.4.yml
~~~

Test run the command twice.

#### Create file inside directory if exists

You have to run "example-0.3.yml" first to create the file. But you can run "example-0.5.yml" without directory to check waht is happening

In this example we have a new concept: conditions

~~~
$ ansible-playbook -i inventory-local example-0.5.yml
~~~

In this example we have a new concept: loops

~~~
$ ansible-playbook -i inventory-local example-0.6.yml
~~~

In this example we have are going to create content inside a file

~~~
$ ansible-playbook -i inventory-local example-0.7.yml
~~~

In this example we have are going to create content inside a file and using a vars file

As you can see, here we are disabling gathering facts

~~~
$ ansible-playbook -i inventory-local example-0.8.yml
~~~

~~~
$ ansible-playbook -i inventory-local example-0.9.yml --extra-var "@vars-file-2.yml" 
~~~

~~~
$ ansible-playbook -i inventory-local example-0.9.yml --extra-var "{ my_directory: '/tmp/new_dir', username: 'Herr_Star' }" 
~~~