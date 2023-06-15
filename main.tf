resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Created_By = var.createby
    Name       = "server ${var.web-servers[count.index]}"
  }
  count    = 5
  key_name = var.key_name
}

