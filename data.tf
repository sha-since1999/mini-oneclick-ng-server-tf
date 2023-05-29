data "aws_vpc" "vpc" {
  default = true
}
data "aws_ami" "ubuntu" {
  most_recent = true
  name_regex  = "^ubuntu*"
  /* owners           = ["self"] */

  filter {
    name   = "name"
    values = ["ubuntu*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}