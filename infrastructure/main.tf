terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "drio-key" {
  key_name   = "ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAxYGZJxirt+7X52tF0Eq90P3YgA5fBNEsDBqESGJYZ4lpmzUerEc58Kx77k3uTPuFsiwrjfAjcVVN2G21C8XuT9AXDrR1JnPlh9hQK41R3hviyX/v9WuOeywSPfYT8tzf9Vw/p4Lcp7ICaya86H1b4Lp0ZtyVWY3ho8Psz025QN8= drio@ligero.local.net"
}

resource "aws_instance" "consul-server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.instance.id]
  associate_public_ip_address = true
  key_name                    = "ssh-key"
  user_data                   = file("./user_data.sh")

  tags = {
    Name = "consul-server"
  }
}

resource "aws_instance" "node1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.instance.id]
  associate_public_ip_address = true
  key_name                    = "ssh-key"
  user_data                   = file("./user_data.sh")

  tags = {
    Name = "consul-node1"
  }
}

resource "aws_instance" "node2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.instance.id]
  associate_public_ip_address = true
  key_name                    = "ssh-key"
  user_data                   = file("./user_data.sh")

  tags = {
    Name = "consul-node2"
  }
}

resource "aws_security_group" "instance" {
  name        = var.security_group_name
  description = "Consul internal traffic + maintenance."

  // These are for internal traffic
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "udp"
    self      = true
  }

  // These are for maintenance
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // This is for outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "template_file" "user_data" {
  template = file("user_data.sh")
}

locals {
  consul_port  = 8301
  ssh_port     = 22
  any_port     = 0
  any_protocol = "-1"
  tcp_protocol = "tcp"
  all_ips      = ["0.0.0.0/0"]
}
