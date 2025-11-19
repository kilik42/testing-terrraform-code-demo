


# I WANT TO CREATE A ROUTE TABLE TO DEFINE HOW TRAFFIC
# IS ROUTED WITHIN MY VPC
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main_igw.id
    }
  ]

  tags = {
    Name = "main_route_table"
  }
}
# I WANT TO CREATE A ROUTE TO ALLOW INTERNET BOUND TRAFFIC
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id 
}


# I WANT TO CREATE A ROUTE TABLE FOR PRIVATE SUBNETS
# resource "aws_route_table" "private" {
#   vpc_id = aws_vpc.main.id

#   tags = {
#     Name = "private_route_table"
#   }
# }

# I WANT TO CREATE A ROUTE TABLE FOR PRIVATE SUBNETS
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route = [

    {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id    = aws_nat_gateway.main.id

    }
  ]

  tags = {
    Name = "private_route_table"
  }
}

# route association for public subnet 1a
resource "aws_route_table_association" "public_1a" {
  subnet_id      = aws_subnet.main_subnet_public_1a.id
  route_table_id = aws_route_table.public.id
}

# route association for public subnet 1b
resource "aws_route_table_association" "public_1b" {
  subnet_id      = aws_subnet.main_subnet_public_1b.id
  route_table_id = aws_route_table.public.id
}

# route association for private subnet 1a
resource "aws_route_table_association" "private_1a" {
  subnet_id      = aws_subnet.main_subnet_private_2a.id
  route_table_id = aws_route_table.private.id
}

# route association for private subnet 1b
resource "aws_route_table_association" "private_1b" {
  subnet_id      = aws_subnet.main_subnet_private_2b.id
  route_table_id = aws_route_table.private.id
}