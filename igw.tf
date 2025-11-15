# I WANT TO CREATE AN INTERNET GATEWAY TO ALLOW COMMUNICATION
# BETWEEN MY VPC AND THE INTERNET
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main_internet_gateway"
  }
}