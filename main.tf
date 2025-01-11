resource "aws_instance" "jenkins_controller" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = ["sg-0a8a5768181754b55"]
  associate_public_ip_address = true
  iam_instance_profile = data.aws_iam_instance_profile.shs.name
  user_data = filebase64("userdata.sh")

  ebs_block_device {
    device_name           = "/dev/xvdf"
    volume_size           = 50          
    encrypted             = true    
    delete_on_termination = true
  }

  tags = {
    Name = "project10-shs-jenkins-test"
  }
}