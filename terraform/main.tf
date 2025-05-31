module "vpc" {
  source = "./vpc"
  # VPC-specific input variables (if any)
}

module "loadbalancer"{
  source = "./load-balancer"

  public1a_subnet_id = module.vpc.public1a_subnet_id
  public1b_subnet_id = module.vpc.public1b_subnet_id
  priv1a_subnet_id   = module.vpc.priv1a_subnet_id
  priv1b_subnet_id   = module.vpc.priv1b_subnet_id
  security_group   = module.vpc.security_group
  vpc_id = module.vpc.vpc_id
#   rds_endpoint = module.rds.rds_endpoint
}

module "ecs"{
    source= "./ECS"
    public1a_subnet_id = module.vpc.public1a_subnet_id
    public1b_subnet_id = module.vpc.public1b_subnet_id
    priv1a_subnet_id   = module.vpc.priv1a_subnet_id
    priv1b_subnet_id   = module.vpc.priv1b_subnet_id
    security_group   = module.vpc.security_group
    vpc_id = module.vpc.vpc_id
    alb_target_group_arn= module.loadbalancer.alb_tg_arn
}