
#PUBLIC SUBNETS
# I WANT TO CREATE A SUBNET INSIDE THE VPC
resource "aws_subnet" "main_subnet_public_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  # NEED A SPECIFIC AVAILABILITY ZONE
  availability_zone = "eu-west-1a"

  tags = {
    Name = "subnet-public-1a"
  }
}

#SECOND PUBLIC SUBNET
resource "aws_subnet" "main_subnet_public_1b" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "eu-west-1b"

  tags = {
    Name = "subnet-public-1b"
  }
}

#PRIVATE SUBNETS
# how do i tie this to the private route table?
resource "aws_subnet" "main_subnet_private_2a" {

    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.11.0/24"
    availability_zone = "eu-west-2a"

    

  tags = {
    Name = "subnet-private-1a"
  }
}

resource "aws_subnet" "main_subnet_private_2b" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.12.0/24"
    availability_zone = "eu-west-2b"

  tags = {
    Name = "subnet-private-1b"
  }
}   
