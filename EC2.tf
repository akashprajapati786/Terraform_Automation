# createing an Ec2 instance requires some other services like VPC, subnet, security group etc.
  
# Key pair creation

resource "aws_key_pair" "terraform_key_pair" {

  key_name = "terraform_key"
  public_key = file("terraform-ec2-key.pub")

}


#Default VPC creation
resource "aws_default_vpc" "default" {
  
}

# Security Group Creation

resource "aws_security_group" "new_security_group" {

  name = "security_group_terraform"
  vpc_id = aws_default_vpc.default.id


  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

ingress {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allowed HTTP traffic"
}

  
 egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
 tags = {
    name = "automate_sg"
 }
  
}




resource "aws_instance" "terraform_server" {

  ami = "ami-0ecb62995f68bb549"
  instance_type = "t3.micro"
  key_name = aws_key_pair.terraform_key_pair.key_name
  security_groups = [aws_security_group.new_security_group.name]

  root_block_device {
      volume_size = 15
      volume_type = "gp3"
  }
  tags = {
    Name = "Terraform-EC2-Instance"
  }
}