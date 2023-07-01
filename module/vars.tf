variable "ami_id" {
  default = "ami-06b09bfacae1453cb"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "instance_name" {
  default = "masoud-ec2"
}
variable "key_name" {
  default = "terraform"
}
variable "web-servers" {
  default = ["web1", "web2", "web3", "web4"]
}
variable "bucket" {
  default = "masoud-buckets"
}
variable "bucket_name" {
  default = "masoud"
}
variable "security_group" {
  default = "nginx-sg"
}
variable "port" {
  default = 80
}
variable "protocol" {
  type        = string
  default     = "tcp"
  description = "description"
}

