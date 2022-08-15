resource "aws_security_group" "primary_security_group" {
  name        = "${var.instance_name}-primary-security-group"
  description = "${var.instance_name} strongswan security group"
  vpc_id      = var.vpc_id
  #  ingress {
  #    from_port   = 22
  #    protocol    = "tcp"
  #    to_port     = 22
  #    cidr_blocks = ["0.0.0.0/0"]
  #  }
  #  ingress {
  #    from_port   = 500
  #    protocol    = "UDP"
  #    to_port     = 500
  #    cidr_blocks = ["0.0.0.0/0"]
  #  }
  #  ingress {
  #    from_port   = 4500
  #    protocol    = "UDP"
  #    to_port     = 4500
  #    cidr_blocks = ["0.0.0.0/0"]
  #  }
  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#resource "aws_security_group" "secondary_security_group" {
#  name        = "${var.instance_name}-secondary-security-group"
#  description = "${var.instance_name} secondary security group"
#  vpc_id      = var.vpc_id
#  ingress {
#    from_port   = 0
#    protocol    = "-1"
#    to_port     = 0
#    cidr_blocks = [var.vpc_cidr]
#  }
#
#  egress {
#    from_port   = 0
#    protocol    = "-1"
#    to_port     = 0
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}