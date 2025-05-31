resource "aws_db_instance" "mydb"{
    allocated_storage = 10
    db_name = "mydb"
    engine = "postgres"
    instance_class = "db.t3.micro"
    username="mushahid"
    password="Redhat123"
    db_subnet_group_name = aws_db_subnet_group.mysub-group.name
    vpc_security_group_ids = [var.security_group]
    skip_final_snapshot = true
    publicly_accessible   = true
}

