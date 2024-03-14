# Pedimos a AWS las zonas disponibles para la region en la que estamos trabajando
data "aws_availability_zones" "az" {}

# Pedimos a AWS las AMIs de ubuntu disponibles
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}