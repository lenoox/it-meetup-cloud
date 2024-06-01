resource "aws_instance" "it-meetup" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.name]
  key_name      = aws_key_pair.generated_key.key_name
  provisioner "local-exec" {
    command = <<EOT
      sleep 30;
	  >itmeetup.ini;
	  echo "[itmeetup]" | tee -a itmeetup.ini;
	  echo "${aws_instance.it-meetup.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=${aws_key_pair.generated_key.key_name}.pem" | tee -a itmeetup.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
	  ansible-playbook -vvvv -u ubuntu --private-key ${aws_key_pair.generated_key.key_name}.pem -i itmeetup.ini ../ansible/itmeetup.yml
    EOT
  }

}
