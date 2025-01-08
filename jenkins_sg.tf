resource "aws_security_group" "jenkins_controller_sg" {
  name        = "project10-jenkins-sg"
  description = "This SG is for Jenkins"
  vpc_id = data.aws_vpc.shs.id
  tags = {
    Name = "project10-jenkins-sg"
  }
  ingress = [
    {
      cidr_blocks = [var.akumo_ip_address]
      description      = "Default Jenkins Port"
      from_port        = 8080
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 8080
    },
    {
      cidr_blocks      = [var.akumo_ip_address]
      description      = "HTTPS"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    }
  ]
}