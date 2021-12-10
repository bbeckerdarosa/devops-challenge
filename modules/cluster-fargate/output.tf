output "fargate_alb_dns_name" {
  value = "${aws_lb.application_lb.dns_name}"
}