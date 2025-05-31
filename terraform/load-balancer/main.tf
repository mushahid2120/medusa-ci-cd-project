
#Medusa-ECS LoadBalancer 

resource "aws_lb" "medusa-ecs" {

  name               = "medusa-ecs"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [ var.security_group ]
  subnets            = [ var.public1a_subnet_id , var.public1b_subnet_id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

#Frontend Listener
resource "aws_lb_listener" "medusa-listener" {
  load_balancer_arn = aws_lb.medusa-ecs.arn
  port              = "9000"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.medusa-tg.arn 
  }
}

