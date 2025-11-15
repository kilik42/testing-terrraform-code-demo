resource "aws_vpc" "main" {
   #cidr block defines the IP address range for the VPC
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default" #instance tenancy can be default or dedicated 
  #what instance tenancy means is whether the instances launched in this VPC
  # will run on shared hardware or on single-tenant hardware
    tags = {
        Name = "main_vpc"
    }   

    # do i need to enable dns support and hostnames?
    enable_dns_support   = true
    #why enable dns hostnames? 
    # if you want to assign public DNS hostnames to instances launched in this VPC
    enable_dns_hostnames = true
    # put that in plain english 
    # If you want your instances to be reachable via a public DNS name, you need to enable this.
    # for example, if you launch an EC2 instance in this VPC and want to access it using a public DNS name,
    # enabling DNS hostnames will allow that instance to receive a public DNS name automatically.
    # This is useful for accessing your instances without needing to remember their IP addresses.
    # real world example: you launch a web server in this VPC and want users to access it using a domain name
    # instead of an IP address, enabling DNS hostnames will facilitate this by providing a public DNS name for the web server instance.

}


#PUBLIC SUBNETS
# I WANT TO CREATE A SUBNET INSIDE THE VPC
resource "aws_subnet" "main_subnet_public_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  # NEED A SPECIFIC AVAILABILITY ZONE
  availability_zone = "eu-west-1a"

  tags = {
    Name = "main_subnet"
  }
}

#SECOND PUBLIC SUBNET
resource "aws_subnet" "main_subnet_public_1b" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "eu-west-1b"

  tags = {
    Name = "main_subnet"
  }
}





# I WANT TO CREATE AN INTERNET GATEWAY TO ALLOW COMMUNICATION
# BETWEEN MY VPC AND THE INTERNET
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main_internet_gateway"
  }
}