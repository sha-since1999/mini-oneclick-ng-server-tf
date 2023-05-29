resource "aws_key_pair" "keypair" {
  key_name   = var.keyname
  public_key = file("${path.module}/test.pub")
}

