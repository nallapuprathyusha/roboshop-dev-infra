variable "project_name" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}


variable "sg_name" {
  default = [
    #database
    "mongodb", "redis","rabbitmq" ,"mysql" ,
    #backend
    "catalogue","user","cart","shipping","payment" ,
    #frontend
    "frontend",
    #bastion
    "bastion",
    #frontend load-balance
    "frontend-lb"
  ]
}