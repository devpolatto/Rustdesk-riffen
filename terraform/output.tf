output "Ec2-Master" {
  value = {
    "EC2" : "Access --- ssh -i '${aws_key_pair.key_pair.key_name}.pem' ubuntu@${aws_instance.ruste_server.public_ip}"
  }
}