variable "name" {}
variable "zone" {}
variable "subnet" {}
variable "startup_script" {}

variable "tags" {
  type    = list(string)
  default = []
}