# Resource-8: Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami                    = data.aws_ami.amzlinux.id  # Amazon Linux
  instance_type          = var.instance_type
  key_name               = "terraform-key"
  subnet_id              = aws_subnet.vpc-dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]
  user_data = file("apache-install.sh")
  availability_zone = "us-east-2a"
  tags = {
    "Name" = "TheHive"
  }
  root_block_device {
    tags = {
      "Name" = "thehive-vol"
    }
    volume_size = 15
    delete_on_termination = true

  }

# # Connection Block for Provisioners to connect to EC2 Instance
#   connection {
#     type = "ssh"
#     host = self.public_ip # Understand what is "self"
#     user = "ec2-user"
#     password = ""
#     private_key = file("private-key/terraform-key")
#   }  

#  # Copies the file-copy.html file to /tmp/file-copy.html
#   provisioner "file" {
#     source      = "apps/docker-compose.yml"
#     destination = "/home/ec2-user/docker-compose.yml"
#   }

#  # Copies the file-copy.html file to /tmp/file-copy.html
#   provisioner "file" {
#     source      = "scripts/TheHive-install.sh"
#     destination = "/home/ec2-user/TheHive-install.sh"
#   }


# # Execute a command to install TheHive
# provisioner "remote-exec" {
#     inline = [
#        "chmod +x /home/ec2-user/TheHive-install.sh",
#        "cd /home/ec2-user",
#        #"TheHive-install.sh",
#        #"docker-compose up -d"
#     ]
# }

}



