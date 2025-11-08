module "sg" {
  count = length(var.sg_name)
  source = "git::https://github.com/nallapuprathyusha/terraform-aws-sg.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = "${var.sg_name[count.index]}-${var.project_name}" 
  sg_description = "created for ${var.sg_name[count.index]}"
  vpc_id = local.vpc_id 
}