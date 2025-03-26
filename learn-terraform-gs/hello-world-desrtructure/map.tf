//map
variable "user-age" {
  type = map(any)
  default = {
    gaurav = 20
    saurav = 40
  }
}
variable "username" {
  type = string
}
output "gauravAge" {
  value = "my name is ${var.username} and my age is ${lookup(var.user-age, "${var.username}")}"
}