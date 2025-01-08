data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "shs" {
  filter {
    name   = "tag:Name"
    values = ["project10-shs-vpc"]
  }
}

data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = ["project10-shs-pub-1"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.shs.id]
  }
}

data "aws_subnet" "private_subnet" {
  filter {
    name   = "tag:Name"
    values = ["project10-shs-priv-2"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.shs.id]
  }
}

data "aws_iam_instance_profile" "shs" {
  name = "project10-shs-ssm-role" # Replace with the exact name of the instance profile
}