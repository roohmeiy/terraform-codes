//provider
provider "aws" {
  region = "us-east-1"
}

//vpc
resource "aws_vpc" "tf-demo-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "tf-demo-vpc"
  }
}

//public subnet
resource "aws_subnet" "tf-demo-pub-subnet" {
  vpc_id     = aws_vpc.tf-demo-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a" 

  tags = {
    Name = "tf-demo-pub-subnet"
  }
}

//internet-gateway
resource "aws_internet_gateway" "tf-demo-igw" {
  vpc_id = aws_vpc.tf-demo-vpc.id

  tags = {
    Name = "tf-demo-igw"
  }
}

//route table public
resource "aws_route_table" "tf-demo-rt" {
  vpc_id = aws_vpc.tf-demo-vpc.id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.tf-demo-igw.id  
  }
}

// route table association
resource "aws_route_table_association" "tf-demo-rt-association" {
  subnet_id      = aws_subnet.tf-demo-pub-subnet.id
  route_table_id = aws_route_table.tf-demo-rt.id
}

//security group
resource "aws_security_group" "tf-demo-sg" {
vpc_id = aws_vpc.tf-demo-vpc.id  
tags = {
    Name = "tf-demo-sg"
  }
  dynamic "ingress" {
    for_each = [22, 443, 80]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
#key-pair
resource "aws_key_pair" "tf-demo-key" {
  key_name   = "tf-demo-key"
  public_key = file("${path.module}/id_rsa.pub")
}

# EC2 Instance
resource "aws_instance" "tf-demo" {
  ami                    = "ami-04b70fa74e45c3917" 
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.tf-demo-key.key_name
  subnet_id              = aws_subnet.tf-demo-pub-subnet.id  
  vpc_security_group_ids = [aws_security_group.tf-demo-sg.id]  
  associate_public_ip_address = true 
  tags = {
    Name = "tf-demo"
  }

  # connection block for SSH
  connection {
    type        = "ssh"
    user        = "ubuntu"  #
    private_key = file("${path.module}/id_rsa") 
    host        = self.public_ip  
  }

  # File provisioner
  provisioner "file" {
    source      = "app.py"  
    destination = "/home/ubuntu/app.py" 
  }

  # Remote-exec provisioner
  provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",  
      "sudo apt-get install -y python3-pip", 
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 app.py &",  
    ]
  }
  depends_on = [aws_security_group.tf-demo-sg, aws_internet_gateway.tf-demo-igw]
}


