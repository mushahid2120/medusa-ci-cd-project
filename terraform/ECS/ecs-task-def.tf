resource "aws_ecs_task_definition" "medusa-task" {
  family                   = "medusa-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "2048"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.iam-role.arn


  container_definitions = jsonencode([{
    name      = "medusa-con"
    image     = "mushahid144/mymedusa:v1"
    cpu       = 1024
    memory    = 2048
    essential = true
    portMappings = [{
      containerPort = 9000
      hostPort = 9000
      protocol      = "tcp"
    }]
    environment = [
      {
        name  = "NODE_ENV"
        value = "production"
      }
    ]
  }])
}

