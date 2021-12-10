resource "aws_lb" "application_lb" {
  name               = "${var.cluster_name}-${var.env}"
  subnets            = aws_subnet.public.*.id
  load_balancer_type = "application"
  security_groups    = [aws_security_group.application_alb_sg.id]
}

resource "aws_lb_target_group" "application_tg" {
  name        = "${var.cluster_name}-${var.env}"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.new.id

  health_check {
    path      = "/version"
  }
}

resource "aws_lb_listener" "application_listener" {
  load_balancer_arn = aws_lb.application_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.application_tg.arn
    type             = "forward"
  }
}