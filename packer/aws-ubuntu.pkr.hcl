source "amazon-ebs" "ubuntu" {
  profile                 = var.profile
  region                  = var.region
  ami_name                = "strongswan-ubuntu-22.04-${var.architecture}"
  instance_type           = var.instance_type
  ami_virtualization_type = "hvm"
  ssh_username            = "ubuntu"

  source_ami_filter {
    filters = {
      # ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-20220420
      name                = "ubuntu/images/hvm-ssd/ubuntu-*-22.04-*-server-*"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
      architecture        = var.architecture
    }
    owners      = [var.owner_id]
    most_recent = true
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  launch_block_device_mappings {
    device_name           = "/dev/sda1"
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
  }
}

build {
  name = "strongswan-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "shell" {
    pause_before = "30s"
    script       = "scripts/setup.sh"
  }
}


variable "region" {
  type    = string
  default = "cn-northwest-1"
}

variable "profile" {
  type    = string
  default = "wwc"
}

variable "instance_type" {
  type    = string
  default = "t4g.small"
}

variable "owner_id" {
  type    = string
  default = "837727238323"
}

variable "architecture" {
  type    = string
  default = "arm64"
}

packer {
  required_version = ">= 1.8.0"
  required_plugins {
    amazon = {
      version = "1.1.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}


