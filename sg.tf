# create security groups for my vpc 
resource "aws_security_group" "security_group_1" {   
  name        = "security_group_1"
  description = "security group 1 for my vpc"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}       



resource "aws_security_group_ingress_rule" "allow_sg_ssh" {   
  security_group_id = aws_security_group.security_group_1.id
  description       = "Allow SSH access from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags{
    Name = "allow_ssh_access for security_group_1"
  }

  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
}


# ingress rule to allow HTTP traffic
resource "aws_security_group_ingress_rule" "allow_http" {   
  security_group_id = aws_security_group.security_group_1.id
  description       = "Allow HTTP access from anywhere"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  tags{
    Name = "allow_http_access for security_group_1"
  }
}

# outputs for security groups
output "security_group_1_id" {
  description = "The ID of security group 1"
  value       = aws_security_group.security_group_1.id
}


