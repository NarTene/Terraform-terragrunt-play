
# Here is a simple example of provisioning a simple EC2 instance -

#I have defined a terraform local instance_name
# The terraform local have a name prefixed with the current workspace name .i.e. - "${terraform.workspace}-instance"
# And the terraform local is used to tag the aws_instance



provider "aws" {
   region     = "us-east-1"
   access_key = "AKIAZ73YQQGCKXXXXXXXXXXXXXX"
   secret_key = "LUVWIuovTnafpqNYAZT1TryWQWWQASQWEQQXXXXXXX"

}

locals {
  instance_name = "${terraform.workspace}-instance"
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0a11fbfd2746b7a31"

     instance_type = var.instance_type      # "t2.micro"

    tags = {
      Name = local.instance_name
    }
}
