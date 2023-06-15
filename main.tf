resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Created_By = var.createby
    Name       = var.instance_name
  }
}
