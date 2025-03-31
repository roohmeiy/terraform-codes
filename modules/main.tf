module "app" {
  source        = "./my-app-infra-module"
  my_env        = var.my_env
  instance_type = var.instance_type
  ami           = var.ami
}
