output "key-name" {
  value = aws_key_pair.keypair.key_name
}
output "default_vpc_id" {
  value = data.aws_vpc.vpc.id
}
output "ami_id" {
  value = data.aws_ami.ubuntu.id
}
output "ami_description" {
  value = data.aws_ami.ubuntu.description
}
output "public_ip" {
  value= aws_instance.web.public_ip
}
