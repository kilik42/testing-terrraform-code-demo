


# I WANT TO CREATE A ROUTE TABLE TO DEFINE HOW TRAFFIC
# IS ROUTED WITHIN MY VPC
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

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
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private_route_table"
  }
}

# I WANT TO CREATE A ROUTE TABLE FOR PRIVATE SUBNETS
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private_route_table"
  }
}