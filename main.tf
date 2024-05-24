resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"

 tags = {
   Name = "Project VPC"
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

  depends_on                = [aws_internet_gateway.gw]
}
