
data "aws_ami" "amazone_linux" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name = "owner-alias"
    values = ["amazon"]

  }

  filter {
    name = "name"
    values = [ "amzn2-ami-hvm*" ]
  }
  
}


