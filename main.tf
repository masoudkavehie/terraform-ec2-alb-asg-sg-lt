resource "aws_instance" "webserver" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Created_By = var.createby
    Name       = "server ${var.web-servers[count.index]}"
  }
  count    = 5
  key_name = var.key_name
  #   lifecycle {
  #     prevent_destroy = true
  #   }
}

resource "local_file" "masoud" {
  filename = "/root/pets.txt"
  content  = "we love ppets!"
}


#importing import aws_instance.webser2 i-01c5fc8f24e777748
resource "aws_instance" "webserver2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

}
