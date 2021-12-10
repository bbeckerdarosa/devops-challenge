resource "aws_ecs_cluster" "cluster" {
  name = "${var.cluster_name}-cluster-${var.env}"
//CloudWatch Container Insights to collect, aggregate, and summarize metrics and logs.
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "application_version" {
  family                   = var.container_name
  network_mode             = var.network_mode
  requires_compatibilities = ["${var.launch_type}"]
  cpu                      = var.cpu
  memory                   = var.memory

  container_definitions = <<TASK_DEFINITION
[
  {
    "image": "bbeckerdarosa/fargate-application-version",
    "cpu": 256,
    "memory": 512,
    "name": "fargate-application-version",
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ]
  }
]
TASK_DEFINITION
}

resource "aws_ecs_service" "service" {
  name            = "${var.cluster_name}-service-${var.env}"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.application_version.arn
  launch_type     = var.launch_type
  desired_count   = var.desired_count

  network_configuration {
    security_groups = [aws_security_group.application_sg.id]
    subnets         = var.subnets
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.application_tg.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  depends_on = [aws_lb_listener.application_listener]
}