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
