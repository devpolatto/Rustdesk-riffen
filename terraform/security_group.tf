######
## Public Access
######
resource "aws_security_group" "public" {
  name        = "sg_ruste_server"
  description = "internet source access"
  vpc_id      = local.vpc_id

  tags = merge(var.common_tags, { Name = "sg_ruste_server" })
}

resource "aws_security_group_rule" "ssh_from_net" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "rust_server_1" {
  type              = "ingress"
  from_port         = 21115
  to_port           = 21119
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "rust_server_2" {
  type              = "ingress"
  from_port         = 8000
  to_port           = 8000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource "aws_security_group_rule" "rust_server_3" {
  type              = "ingress"
  from_port         = 21116
  to_port           = 21116
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

###
# allowed traffic to net
###
resource "aws_security_group_rule" "allowed_traffic_to_net" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

  security_group_id = aws_security_group.public.id
}