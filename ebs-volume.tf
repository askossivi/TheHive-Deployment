# EBS
resource "aws_ebs_volume" "vol-data" {
  availability_zone = "us-east-2a"
  size = 15
  tags = {
    "Name" = "vol-data"
  }
}

# Volume attachment
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.vol-data.id
  instance_id = aws_instance.my-ec2-vm.id
}

