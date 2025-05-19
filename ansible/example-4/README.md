Con este ejemplo se muestra cómo se puede instalar un servidor nginx y un servidor nodejs en dos maquinas separadas

Las maquinas deben estar indicadas en el fichero inventory como se puede ver en el ejemplo de "inventory-dockers"

La forma de ejecutarlo es la siguiente:

~~~
$ ansible-playbook -i inventory-dockers main_v2.yml
~~~

Este ejemplo se puede realizar con el docker-compose.yml que se encuentra en el directorio "docker-ready"