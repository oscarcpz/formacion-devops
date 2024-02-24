# Docker for Ansible

~~~
$ docker build -t ansible_img .
$ docker run -it --name ansible -v $PWD:/tmp --rm ansible_img /bin/bash
~~~