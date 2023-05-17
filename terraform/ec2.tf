resource "aws_instance" "ruste_server" {
  ami               = local.ec2_ami
  instance_type     = "t2.micro"
  availability_zone = "${local.region}a"
  key_name = aws_key_pair.key_pair.id
  user_data = file("install_docker.sh")

  network_interface {
    network_interface_id = aws_network_interface.rust_server_interface.id
    device_index         = 0
  }

  tags = merge(var.common_tags, { Name = "Rust Server" })
}