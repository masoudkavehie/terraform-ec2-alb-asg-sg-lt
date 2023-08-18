# resource "aws_instance" "my_instance" {
#   ami           = var.ami_id
#   instance_type = var.instance_type
#   key_name      = var.key_name
#   tags = {
#     Name = "Server ${var.web-servers[count.index]}"
#   }
#   count     = 4
#   user_data = file("module/script.sh")

# }

# resource "aws_s3_bucket" "masoud" {
#   bucket = var.bucket
#   tags = {
#     Name = var.bucket_name
#   }
# }
#security_group 
resource "aws_security_group" "nginx_sg" {
  name        = var.security_group
  description = "Security group for Nginx instances"
  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = var.protocol
    cidr_blocks = ["0.0.0.0/0"] # Adjust for your desired IP range
  }
  ingress {
    from_port   = var.port1
    to_port     = var.port1
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
resource "aws_security_group" "nginx_lb2" {
  name        = "nginx_lb2"
  description = "Allow standard http and https ports inbount and everything outbound"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#create luanche template

resource "aws_launch_configuration" "nginx_lt" {
  name          = "nginx-lt"
  image_id      = var.ami_id # Replace with your desired AMI ID
  instance_type = "t2.micro" # Replace with your desired instance type
  security_groups = [aws_security_group.nginx_sg.name]
}


resource "aws_autoscaling_group" "nginx_asg" {
  name                 = "nginx-asg"
  min_size             = 3                          # Adjust as needed
  max_size             = 8                          # Adjust as needed
  desired_capacity     = 5                          # Adjust as needed
  launch_configuration      = aws_launch_configuration.nginx_lt.name
  vpc_zone_identifier = ["subnet-09b7913f2ce85044f"]
}

resource "aws_lb_target_group" "nginx_tg" {
  name        = "nginx-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = "vpc-0f2d9844a7458ab0c" # Replace with your VPC ID
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
  }
}
resource "aws_lb" "nginx_alb" {
  name               = "nginx-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nginx_lb2.id]
  subnets            = [var.subnet1, var.subnet2] # Replace with your subnet IDs

  tags = {
    Name = "nginx-alb"
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.nginx_asg.id
  alb_target_group_arn   = aws_lb_target_group.nginx_tg.arn
}

resource "aws_lb_listener" "nginx_listener" {
  load_balancer_arn = aws_lb.nginx_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.nginx_tg.arn
    type             = "forward"
  }
}