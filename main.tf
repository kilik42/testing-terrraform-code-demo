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

output "vpc_cidr_block" {
    description = "The CIDR block of the VPC"
    value = aws_vpc.main.cidr_block
}
