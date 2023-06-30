resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  tags = {
    Name = "Server ${var.web-servers[count.index]}"
  }
  count = 4
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket
  tags = {
    Name = var.bucket_name
  }
}
