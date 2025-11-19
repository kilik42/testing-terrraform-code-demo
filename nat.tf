# NAT GATEWAY TO ALLOW INSTANCES IN PRIVATE SUBNETS
# TO ACCESS THE INTERNET FOR UPDATES ETC
# I WANT TO CREATE AN ELASTIC IP FOR THE NAT GATEWAY
# why do i need an elastic ip for the nat gateway?
# A NAT Gateway requires an Elastic IP address to enable outbound internet access for instances

resource "aws_eip" "nat_eip" {
  # vpc = true

  tags = {
    Name = "nat_eip"
  }
}

# I WANT TO CREATE A NAT GATEWAY
resource "aws_nat_gateway" "main" {
  # A NAT Gateway requires an Elastic IP address to enable outbound internet access for instances
  allocation_id = aws_eip.nat_eip.id

  # The NAT Gateway must be in a public subnet
  subnet_id    = aws_subnet.main_subnet_public_1a.id

  tags = {
    Name = "main_nat_gateway"
  }
  depends_on = [ aws_internet_gateway.main_igw]
}

