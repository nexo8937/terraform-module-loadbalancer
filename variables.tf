variable "pub-sub-A" {}

variable "pub-sub-B" {}

variable "vpc" {}

variable "instance-port" {
  default = "80"
}

variable "target" {
  default = "HTTP:80/wp-admin/install.php"
}
