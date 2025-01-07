# Bastion Instance for creating it EC2 to login into private machine
resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_1.id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  associate_public_ip_address = true 

  tags = {
    Name = "bastion"
  }
}

# Jenkins Instance creation in EC2 for private subnet
resource "aws_instance" "jenkins" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = {
    Name = "jenkins"
  }
}

# App Instance creation in EC2 ufor private subnet part
resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private_2.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = {
    Name = "app"
  }
}


