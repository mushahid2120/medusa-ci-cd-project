resource "aws_db_subnet_group" "mysub-group" {
  name       = "mydb-subnet-group"
  subnet_ids = [var.priv1a_subnet_id , var.priv1b_subnet_id]

  tags = {
    Name = "My DB subnet group"
  }
}