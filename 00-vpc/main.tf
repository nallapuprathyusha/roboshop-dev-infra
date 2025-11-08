module "vpc" {
    source = "git::https://github.com/nallapuprathyusha/terraform-aws-vpc.git?ref=main"
    # vpc_cidr = "10.0.0.0/16"
    # project_name = "roboshop"
    # environment = "dev"

    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    environment = var.environment
    vpc_tags = var.vpc_tags

    #public subnets
    public_subnet_cidris = var.public_subnet_cidrs

    #private subnets
    private_subnet_cidris = var.private_subnet_cidrs
  
     #database subnets
    data_subnet_cidris = var.data_subnet_cidrs
  
 
}