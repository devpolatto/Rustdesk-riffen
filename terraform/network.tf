resource "aws_network_interface" "rust_server_interface" {
  subnet_id       = local.subnet
  private_ips     = ["192.168.10.20"]
  security_groups = [aws_security_group.public.id]
  tags = merge(var.common_tags, { Name = "rust_server_net" })
}