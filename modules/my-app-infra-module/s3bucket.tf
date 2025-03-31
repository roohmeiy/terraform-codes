resource "aws_s3_bucket" "my_app_bucket" {
    bucket = "${var.my_env}-pihu22"
    tags = {
        Name = "${var.my_env}-pihu22"
    }
}