output portainer_url {
    value = format("https://locahost:%s", docker_container.portainer.ports[1].external)
}

output "backend_state" {
  description = "The path to the backend state file"
  value       = "${path.module}/terraform.tfstate"
}