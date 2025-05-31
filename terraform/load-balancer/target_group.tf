#FrontEnd Target Group
resource "aws_lb_target_group" "medusa-tg" {
  name     = "medusa-tg"
  port     = 9000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"
}



# resource "aws_lb_target_group_attachment" "att_tg_instance" {
#   target_group_arn = aws_lb_target_group.mytg.arn
#   target_id        = "i-0544be3a8033e9c77"
#   port             = 80
# }

