resource "aws_instance" "bastion" {
      ami = local.ami_id
      vpc_security_group_ids = [local.mongodb_sg_id]
      instance_type = "t3.micro"
      subnet_id = local.database_subnet_id
      
      tags = merge(
        local.common_tags,
        {
           Name = "${common_name_sufix}-database" #roboshop-dev-mongodb
        }

      )
     
    }

    resource "terraform_data" "mongodb" {
        triggers_replace = [ # if the new instance is created this trigger will triggers the below creation
        aws_instance.mongodb.id 
  ]
  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip
  }

  # terraform copies this file to mongodb server
  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",
        # "sudo sh /tmp/bootstrap.sh"
        "sudo sh /tmp/bootstrap.sh mongodb"
    ]
  }
}


    