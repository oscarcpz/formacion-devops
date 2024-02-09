# Example 1

First of all we are going to prepare our environment to run Terraform.

## Terrform configuration

### Docker with Terraform - option 1

You can use oficial Terraform image

~~~
$ docker run --rm --name terraform -it -v $(pwd):/workspace -w /workspace hashicorp/terraform apply my_file.tf
~~~

### Docker with Terraform - option 2

You can customized your own Terraform image to run your scripts inside container

~~~
$ docker build -t terraform_img .
$ docker run --name terraform --privileged -it -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/workspace -w /workspace terraform_img /bin/bash
~~~

* `--privileged` - the container runs in privileged mode
* `/var/run/docker.sock` - if you share this file with the container, Terraform will be able to create containers in the host
* `-v $(pwd):/workspace` - your working directory will be your current directory. You must have tf files here

## Terraform first example

This example will create a Portainer container in the host.

Inside Terraform docker:

~~~
$ terraform init
$ terraform plan
$ terraform apply
$ terraform destroy
~~~

## References

* [Dockerhub Terraform](https://hub.docker.com/r/hashicorp/terraform)
* [Terraform in Docker tutorial](https://www.mrjamiebowman.com/software-development/docker/running-terraform-in-docker-locally/)
* [Portainer](https://docs.portainer.io/start/install-ce/server/docker/linux)
