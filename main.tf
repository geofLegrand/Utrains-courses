
resource "aws_instance" "web" {
  ami = "ami-0c7217cdde317cfec" # data.aws_ami.amazone_linux.id
  instance_type = var.size
  vpc_security_group_ids = [data.aws_security_groups.my_secgroups.ids[0]]
  key_name = aws_key_pair.ec2_key.key_name
  #vp = [data.aws_security_groups.my_secgroups.ids[0]]
  user_data = <<-EOT
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        echo '<h1>This is deployed by Kossi </h1>' | sudo tee /var/www/html/index.html
    EOT
  #"${file("userData.sh")}"
  tags = {
    Name = "my-Server"
  }
}

# Create null resource to instantiate the connection
resource "null_resource" "name" {
  
  connection {
    type = "ssh"
    user = "ubuntu" #"ec2_user"
    private_key = file(local_file.ssh_key.filename)
    host = aws_instance.web.public_ip

  }

# waiting for ec2 instance to be created or available 
  depends_on = [ aws_instance.web ]
}



