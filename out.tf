
output "ami" {
  value = data.aws_ami.amazone_linux.id
}

output "login" {
  
  #ec2-user@
  value = join("",["ssh -i ec2_key_pair.pem ubuntu@",aws_instance.web.public_dns])
}

output "filename_userData" {
   value = "${file("userData.sh")}"
}
# output "key" {
#    value = tls_private_key.my_ec2_key.public_key_openssh
# }




