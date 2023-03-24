#Creating load balancer
resource "aws_elb" "load-balancer" {
  name            = "load-balancer"
  internal        = false
  security_groups = [aws_security_group.lb-sg.id]
  subnets         = [var.pub-sub-A, var.pub-sub-B]
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = 80
    instance_protocol = "http"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = var.target
  }
  tags = {
    Name = "load-balancer"
  }
}

#Creating Load Balancer security group
resource "aws_security_group" "lb-sg" {
  name        = "load balancer sg"
  vpc_id      = var.vpc
  description = "Allow HTTP and HTTPS traffic"

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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Load Balances sg"
  }
}
