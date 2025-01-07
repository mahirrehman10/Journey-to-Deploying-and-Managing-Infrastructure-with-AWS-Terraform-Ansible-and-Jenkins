# Security group for the bastion host
resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.vpc_main.id

  # Ingress rule to allow SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

# Security group for the private instances
resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.vpc_main.id

  # Ingress rule to allow SSH access (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.vpc_main.cidr_block]
  }

  # Ingress rule to allow all traffic within the VPC
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_vpc.vpc_main.cidr_block]
  }

  # Egress rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}

# Security group for the public web instances
resource "aws_security_group" "public_web_sg" {
  vpc_id = aws_vpc.vpc_main.id

  # Ingress rule to allow HTTP access (port 80) from any IP
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-web-sg"
  }
}
