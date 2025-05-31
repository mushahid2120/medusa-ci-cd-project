resource "aws_elasticache_cluster" "medusa-redis" {
  cluster_id           = "medusa-redis"
  engine               = "redis"
  node_type            = "cache.t4g.micro"
  num_cache_nodes      = 1
  port                 = 6379
  security_group_ids = [var.security_group]
  subnet_group_name    = aws_elasticache_subnet_group.medusa_redis_subnet_group.id

}

resource "aws_elasticache_subnet_group" "medusa_redis_subnet_group" {
  name       = "medusa-redis-subnet-group"
  subnet_ids = [var.priv1a_subnet_id , var.priv1b_subnet_id]

  tags = {
    Name = "medusa-redis-subnet-group"
  }
}