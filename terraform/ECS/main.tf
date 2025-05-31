
resource "aws_ecs_cluster" "medusa-cluster" {
  name = "medusa-cluster"
}

# ECS Service
resource "aws_ecs_service" "medusa_service" {
  name            = "medusa_ecs_service"
  cluster         = aws_ecs_cluster.medusa-cluster.id
  task_definition = aws_ecs_task_definition.medusa-task.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  platform_version = "LATEST"
  scheduling_strategy = "REPLICA"
  depends_on     = [aws_iam_role.iam-role]


  network_configuration {
    subnets         = [ var.priv1a_subnet_id , var.priv1b_subnet_id ]
    security_groups = [var.security_group]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.alb_target_group_arn
    container_name   = "medusa-con"
    container_port   = 9000
  }

}

