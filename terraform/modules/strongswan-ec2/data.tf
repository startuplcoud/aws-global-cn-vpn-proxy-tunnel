data "aws_caller_identity" "account_id" {

}

data "aws_ami" "ubuntu" {
  owners      = [data.aws_caller_identity.account_id.account_id]
  most_recent = true
  filter {
    name   = "name"
    values = ["strongswan-ubuntu-22.04-${var.architecture}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = [var.architecture]
  }
}