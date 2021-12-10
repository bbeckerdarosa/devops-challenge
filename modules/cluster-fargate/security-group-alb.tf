resource "aws_security_group" "application_alb_sg" {
  name        = "${var.cluster_name}-${var.env}-alb"
  vpc_id      = aws_vpc.new.id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}