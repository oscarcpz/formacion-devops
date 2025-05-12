~~~
$ WORKSPACE=$(pwd)/../ docker compose config
$ WORKSPACE=$(pwd)/../ docker compose up -d
$ docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <nombre_o_id_del_contenedor>
$ ssh -p 2221 ansible@<ip_contenedor>
~~~