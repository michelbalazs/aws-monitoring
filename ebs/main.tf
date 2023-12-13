resource "aws_instance" "ec2_instances" {
  count         = var.count
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  security_groups = [var.security_group_id]

  iam_instance_profile {
    name = var.iam_role_name
  }

  tags = {
    Name = "Instance-${count.index + 1}"
  }
}