terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

provider "docker" {
  #host = "tcp://localhost:2375"
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "portainer" {
  name = "portainer/portainer-ce:latest"
}

resource "docker_image" "debian" {
  name      = "custom_debian"
  build     {
    path = "${path.cwd}/../docker_example"
    tag     = ["custom_debian"]
  }
}

resource "docker_volume" "portainer_data" {
  name = "portainer_data"
}

# Creating a Docker Container using the latest ubuntu image.
# docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
resource "docker_container" "portainer" {
  image             = docker_image.portainer.image_id
  name              = "portainer"
  hostname          = "portainer"
  restart           = "always"
  privileged        = true
  ports {
    internal        = 8000
    external        = 8000
  }
  ports {
    internal        = 9443
    external        = 9443
  }
  volumes {
    host_path       = "/var/run/docker.sock"
    container_path  = "/var/run/docker.sock"
  }
  volumes {
    volume_name     = docker_volume.portainer_data.name
    container_path  = "/data portainer/portainer-ce"
  }
}

resource "docker_container" "host1" {
  image             = docker_image.debian.image_id
  name              = "host1"
  hostname          = "host1"
  command           = ["tail", "-f", "/dev/null"]
}

resource "docker_container" "host2" {
  image             = docker_image.debian.image_id
  name              = "host2"
  hostname          = "host2"
  command           = ["tail", "-f", "/dev/null"]
}