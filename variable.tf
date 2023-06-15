variable "ami" {
  default = "ami-022e1a32d3f742bd8"
}
variable "instance_type" {

  default = "t2.micro"

}
variable "instance_name" {
  default = "web-server"
}
variable "createby" {
  default = "masoudkaveh"
}
variable "web-servers" {
  type    = list(string)
  default = ["web1", "web2", "web3", "web4", "web5"]
}
variable key_name {
}

