resource "aws_elb" "load-balancer" {
  name            = "load-balancer"
  internal        = false
  security_groups = [var.lb-sg]
  subnets         = [var.pub-sub-A, var.pub-sub-B]
  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
  health_check {
    healthy_threshold   = 2 #
    unhealthy_threshold = 2 #
    timeout             = 3
    interval            = 30
    target              = "HTTP:80/wp-admin/install.php"
  }
  tags = {
    Name = "load-balancer"
  }
}

