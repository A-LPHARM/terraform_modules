resource "aws_lb" "application_loadbalancer" {
  name                       = "${var.henryproject}-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.alb_sec_grp]
  subnets                    = [var.publicsubnet2, var.publicsubnet]
  enable_deletion_protection = false

  tags ={
    name = "${var.henryproject}-alb"
  }
}

#target group
resource "aws_lb_target_group" "alb_target_group" {
    # App1 Target group
      name                  = "${var.henryproject}-tg"
      protocol              = "HTTP"
      port                  = 80
      target_type           = "instance"
      vpc_id                = var.vpc_id

      health_check = {
        enabled             = true
        interval            = 300
        path                = "/"
        port                = "traffic-port"
        healthy_threshold   = 5
        unhealthy_threshold = 3
        timeout             = 60
        protocol            = "HTTP"
        matcher             = "200"
      }  

#create a listener on port 80 with forward action

resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_loadbalancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


#create a listener on port 443 with forward action
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_loadbalancer.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn   #"arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

}

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }