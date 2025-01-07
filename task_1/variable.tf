# Define the region area to used
variable "region" {
  description = "The AWS region to deploy resources"
  default     = "us-east-1"
}

# Define the first availability zone within the region
variable "az1" {
  description = "The first availability zone"
  default     = "us-east-1a"
}

# Define the second availability zone within the region
variable "az2" {
  description = "The second availability zone"
  default     = "us-east-1b"
}

# Define the third availability zone within the region
variable "az3" {
  description = "The third availability zone"
  default     = "us-east-1c"
}

# Define the Ami  IDfor references to use for ec2
variable "ami_id" {
  description = "The AMI ID to use for EC2 instances"
  default     = "ami-0e2c8caa4b6378d8c"
}

# Define the instance type to use for ec2
variable "instance_type" {
  description = "The instance type to use for EC2 instances"
  default     = "t2.micro"
}

# Define the VPC CIDR block networking
variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.100.0.0/16"
}

# Define public subnet CIDR blocks network code
variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
  default     = "10.100.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
  default     = "10.100.2.0/24"
}

variable "public_subnet_3_cidr" {
  description = "CIDR block for public subnet 3"
  type        = string
  default     = "10.100.3.0/24"
}

# Define private subnet CIDR blocks networkcode
variable "private_subnet_1_cidr" {
  description = "CIDR block for private subnet 1"
  type        = string
  default     = "10.100.4.0/24"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for private subnet 2"
  type        = string
  default     = "10.100.5.0/24"
}

variable "private_subnet_3_cidr" {
  description = "CIDR block for private subnet 3"
  type        = string
  default     = "10.100.6.0/24"
}
