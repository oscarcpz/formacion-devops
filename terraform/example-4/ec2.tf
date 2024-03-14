# Creamos la instancia
resource "aws_instance" "ec2_opc" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  # importante!! - el nombre de la clave es el nombre de la Key Pair creada por consola y de la que debemos disponer del fichero .pem
  key_name = var.key_name

  monitoring = true

  vpc_security_group_ids = [aws_security_group.sg_opc.id]
  subnet_id = aws_subnet.subnet_opc.id

  # definimos el tamaño del volumen raiz de la instancia
  root_block_device {
    volume_size = var.root_storage_size
    volume_type = "gp3"
    delete_on_termination = true

    tags = {
      Name = "OPC_ROOT_VOLUME_EC2"
      Project = var.tag_project
      Owner = var.tag_owner
      Creator = var.tag_creator
    }
  }

  tags = {
    Name = "OPC_EC2",
    Project = var.tag_project
    Owner = var.tag_owner
    Creator = var.tag_creator
  }

}