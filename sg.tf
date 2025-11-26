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
    cidr_blocks = ["0.0.0.0/0"] # allow from anywhere this is set to this range because its http traffic
    
  } 
  tags{
    Name = "allow_http_access for security_group_1"
  }
}


#egress rule to allow all outbound traffic
# why i would need this if egress is already defined in security group?
# The egress block in the security group defines the default outbound rules, but this allows for more granular control.
resource "aws_security_group_egress_rule" "allow_all_outbound" {   
  security_group_id = aws_security_group.security_group_1.id
  description       = "Allow all outbound traffic"

  egress {
    from_port   = 0
    to_port     = 0
    # -1 means all protocols
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]   

  }
  tags{
    Name = "allow_all_outbound for security_group_1"
  }
}

# outputs for security groups
output "security_group_1_id" {
  description = "The ID of security group 1"
  value       = aws_security_group.security_group_1.id
}


#security group for load balancer
resource "aws_security_group" "lb_sg" {   
  name        = "lb_security_group"
  description = "Security group for load balancer"
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