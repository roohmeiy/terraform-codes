resource "aws_key_pair" "terra-key" {
  key_name   = "terra-key"
  public_key = file("${path.module}/id_rsa.pub")
}
