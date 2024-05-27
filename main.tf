resource "aws_vpc" "main" {
 cidr_block = "172.24.0.0/16"

 tags = {
   Name = "Project VPC 172"
 }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}


resource "aws_eip" "bar" {
  domain = "vpc"

 tags = {
   Name = "EIP VPC"
 }

  depends_on                = [aws_internet_gateway.gw]
}
