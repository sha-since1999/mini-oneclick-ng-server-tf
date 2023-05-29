resource "aws_instance" "web" {
  ami             = "ami-053b0d53c279acc90"
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.keypair.id
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  /* user_data       = file("${path.module}/bootstrap.sh") */
  tags = {
    Name = "rs-web-tf"
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/test")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "pwd",
      "hostname -i",
      "echo '${self.private_ip}'"
    ]
  }
  provisioner "remote-exec" {
    on_failure = continue
    script     = "./bootstrap.sh"
  }
  provisioner "remote-exec" {
    scripts = ["./script.sh"]
  }
  provisioner "file" {
    source      = "./out.txt"
    destination = "/tmp/out.txt"
  }
  provisioner "file" {
    # using dash to ignore tabs
    content     = <<-EOF
                hi this content im writing on 
                remote server
                EOF
    destination = "/tmp/content.txt"
  }
  provisioner "file" {
    content     = file("${path.module}/bootstrap.sh")
    destination = "/tmp/file-content.txt"
  }
}