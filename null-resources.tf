resource "null_resource" "test" {

  /* this is only require in case of remote_exec provisioner */

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command     = "echo 'The servers is creating' >> out.txt && chmod +x ./script.sh ./bootstrap.sh"
  }
  provisioner "local-exec" {
    on_failure = continue
    environment = {
      FOO = "bar"
      BAR = 1
      BAZ = "true"
    }
    command = "env|grep foo && ./script.sh >> out.txt"
  }
  provisioner "local-exec" {
    when       = destroy
    command    = "echo 'The servers is destorying' | date  >> out.txt"
    on_failure = continue
  }
  provisioner "local-exec" {
    working_dir = "."
    interpreter = ["/usr/bin/python3", "-c"]
    command     = "print('hello form python')"
    on_failure  = continue
  }

}


