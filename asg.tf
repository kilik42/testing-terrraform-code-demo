# create auto scaling group
resource "aws_autoscaling_group" "asg" {
    launch_configuration = aws_launch_configuration.lc.id
    min_size             = 2
    max_size             = 5
    desired_capacity     = 3
    vpc_zone_identifier  = [aws_subnet.main_subnet_private_2a.id, aws_subnet.main_subnet_private_2b.id]
    
    tag {
        key                 = "Name"
        value               = "my-asg-instance"
        propagate_at_launch = true
    }
    
    lifecycle {
        create_before_destroy = true
    }
}   

# create launch configuration
resource "aws_launch_configuration" "lc" {
    name_prefix   = "my-launch-config-"
    image_id      = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI
    instance_type = "t2.micro"
    security_groups = [aws_security_group.security_group_1.id]

    lifecycle {
        create_before_destroy = true
    }
}
