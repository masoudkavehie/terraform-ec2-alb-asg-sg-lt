module "ec2-masoud" {
  source = "./module"
}
#  import aws_instance.masoud3 i-09353b7c22f914c7f
resource "aws_instance" "masoud3" {
  ami = "ami-06b09bfacae1453cb"
  instance_type = "t2.micro"
}

provider "aws" {
  region = "us-east-1"
}