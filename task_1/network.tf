# Define the VPC
resource "aws_vpc" "vpc_main" {
  cidr_block       = var.vpc_cidr  
  instance_tenancy = "default"
  tags = {
    Name = "vpc_task"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_main.id
  tags = {
    Name = "igw"
  }
}

# Create public subnets
resource "aws_subnet" "public_1" {
  availability_zone = var.az1  
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.public_subnet_1_cidr 
  tags = {
    Name = "public-subnet1"
  }
}

resource "aws_subnet" "public_2" {
  availability_zone = var.az2 
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.public_subnet_2_cidr  
  tags = {
    Name = "public-subnet2"
  }
}

resource "aws_subnet" "public_3" {
  availability_zone = var.az3  
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.public_subnet_3_cidr  
  tags = {
    Name = "public-subnet3"
  }
}

# Create private subnets
resource "aws_subnet" "private_1" {
  availability_zone = var.az1  
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.private_subnet_1_cidr  
  tags = {
    Name = "private-subnet1"
  }
}

resource "aws_subnet" "private_2" {
  availability_zone = var.az2  
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.private_subnet_2_cidr  
  tags = {
    Name = "privatesubnet2"
  }
}

resource "aws_subnet" "private_3" {
  availability_zone = var.az3  
  vpc_id            = aws_vpc.vpc_main.id
  cidr_block        = var.private_subnet_3_cidr  
  tags = {
    Name = "privatesubnet3"
  }
}

# Allocate an Elastic IP for the NAT Gateway
resource "aws_eip" "eip" {
  domain = "vpc"
}

# Create a NAT Gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_1.id
  tags = {
    Name = "NATgateway"
  }
}

# Create route tables
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_main.id

  # Route to allow internet access via the Internet Gateway
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc_main.id

  # Route to allow internet access via the NAT Gateway
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private-rt"
  }
}

# Associate route tables with subnets
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_3" {
  subnet_id      = aws_subnet.public_3.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_3" {
  subnet_id      = aws_subnet.private_3.id
  route_table_id = aws_route_table.private.id
}
