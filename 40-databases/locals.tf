locals {
  ami_id = data.aws_ami.joindevops.id
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id
  database_subnet_id = split("," , data.aws_ssm_parameter.database_subnet_id.value)[0]

  common_tags ={
    project = var.project_name
    environment = var.environment
    Terraform = true
  }
  common_name_sufix = "${var.project_name}-${var.environment}"
}