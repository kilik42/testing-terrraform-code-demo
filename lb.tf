# creating a load balancer in Terraform
resource "aws_lb" "load_balancer" {
  name               = "loadbalancer-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [aws_subnet.main_subnet_public_1a.id, aws_subnet.main_subnet_public_1b.id]

  tags = {
    Name = "loadbalancer-lb"
  }
}