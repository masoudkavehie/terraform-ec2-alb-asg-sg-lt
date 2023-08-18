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
variable "port1" {
  default = 22
}
variable "protocol" {
  type        = string
  default     = "tcp"
  description = "description"
}
variable "protocol1" {
  type        = string
  default     = "ssh"
  description = "description"
}
variable "subnet1" {
  type    = string
  default = "subnet-069959160d2d9de07"
}
variable "subnet2" {
  type    = string
  default = "subnet-0b0b40a268171cece"
}
