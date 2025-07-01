
resource "aws_key_pair" "openvpn" {
  key_name   = "openvpn"
  public_key = file("D:\\DevSecOps-Aws-84\\joinDevOps\\openvpn.pub")  # for windows use \\ for path 
}



resource "aws_instance" "vpn" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.vpn_sg_id]
  subnet_id = local.public_subnet_id
key_name = aws_key_pair.openvpn.key_name
user_data = file("openvpn.sh")


  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-vpn"
    }
  )
}