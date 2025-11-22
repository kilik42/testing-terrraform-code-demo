# create EC2 instance
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main_subnet_public_1a.id
  security_groups = [aws_security_group.security_group_1.name]
  associate_public_ip_address = true 

  tags = {
    Name = "WebServerInstance"
  }
}