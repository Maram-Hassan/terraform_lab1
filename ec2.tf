resource "aws_instance" "TerraformInstance" {
  ami           = "ami-08c40ec9ead489470" # Latest Amazon Linux 2 AMI (Free Tier eligible in us-east-1)
  instance_type = "t2.micro"              # Free Tier eligible instance type
  subnet_id     = aws_subnet.terraform-subnet.id

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]

  tags = {
    Name = "TerraformInstance"
  }
}

resource "aws_security_group" "allow_http_ssh" {
  name        = "allow_http_ssh"
  description = "Security group to allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.terraform-vpc.id # Associate with the correct VPC

  # Ingress rules (incoming traffic)
  ingress {
    description = "Allow HTTP (IPv4)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]  # Allows HTTP traffic from any IPv4 address
  }

  ingress {
    description = "Allow HTTP (IPv6)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    ipv6_cidr_blocks = ["::/0"]  # Allows HTTP traffic from any IPv6 address
  }

  tags = {
    Name = "allow_http_ssh"
  }
}



