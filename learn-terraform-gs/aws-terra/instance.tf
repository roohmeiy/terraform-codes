data "aws_ami" "ubuntu" {
  most_recent      = true
  owners           = ["099720109477"]

  filter {
    name   = "name"
    values = ["${var.ami_value}"]
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

resource "aws_instance" "instance1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type_value
  key_name      = aws_key_pair.terra-key.key_name
  security_groups = [aws_security_group.terra-sg.name]
  tags = {
    Name = "instance1"
  }
  user_data = file("${path.module}/script.sh")
  #file, local-exec, remote-exec
# connection {
#     type = "ssh"
#     user = "ubuntu"
#     private_key = file("${path.module}/id_rsa")
#     host = "${self.public_ip}"
#   }
# provisioner "file" {
#   source = "README.md"
#   destination = "/tmp/README.md"
#   }
# provisioner "file" {
#   content = "this is content block"
#   destination = "/tmp/README.md"
#   }
# provisioner "local-exec" {
#   command = "echo ${self.public_ip} > public_ip.txt"
#  }
# provisioner "local-exec" {
#   working_dir ="/root/learn-terraform-gs/aws-terra"
#   interpreter = [
#     "/usr/bin/python3", "-c"
#   ]
#   command = "print('hello world')"
# } 
# provisioner "local-exec" {
# when = destroy
# command="echo 'at delete'"
# }
# provisioner "remote-exec" {
#   inline =[
#     "ifconfig >/ifconfig.output"
#   ]
# }
# provisioner "remote-exec" {
#   script = "./script1.sh"
# }

}

