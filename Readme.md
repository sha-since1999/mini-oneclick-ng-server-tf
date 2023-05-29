Terraform imp commands

* terraform init
* terraform providers
* terraform fmt
* terraform validate
* terraform plan -out tfplan  -target aws_key_pair.keypair
* terrafrom apply tfplan
* terraform show # show current state
* terraform refresh # refresh current state
* terraform taint aws_instance.web # mark as damage to resource
* terraform destroy -target aws_instance.web
