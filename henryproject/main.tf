# create vpc
module "vpc" {
    source = "../modules/dynamodb-henry"
    aws_region              = var.aws_region
    henryproject            = var.henryproject
    vpc_cidr                = var.vpc_cidr
    public_bastionsubnet1   = var.public_bastionsubnet1
    publicsubnet2           = var.publicsubnet2
    privatesubnet1          = var.privatesubnet1
    privatesubnet2          = var.privatesubnet2
}

#security
module "security" {
  source = "../modules/security"
  vpc_id = module.vpc.vpc_id
}

module "application_load_balancer" {
  source = "../modules/alb"
  henryproject        = module.vpc.henryproject
  alb_sec_grp         = module.security.alb_sec_grp
  publicsubnet        = module.vpc.publicsubnet
  publicsubnet2       = module.vpc.publicsubnet2
  vpc_id              = module.vpc.vpc_id
  certificate_arn     = module.acm.certificate_arn
}

#database
module "database" {
  source = "../modules/database"
  henryproject   = module.vpc.henryproject
  vpc_id         = module.vpc.vpc_id
  privatesubnet1 = module.vpc.privatesubnet1
  privatesubnet2 = module.vpc.privatesubnet2
  rds_sg         = module.security.rds_sg
}

module "route_53" {
  source   =  "../modules/route_53"
  hosted_zone = module.route_53.hosted_zone
  domain_site = module.route_53.domain_site
  
}