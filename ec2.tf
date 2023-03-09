resource "aws_instance" "web" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t3.micro"
  subnet_id     = "subnet-014d294947bd30b84"
  tags = {
    Name = "Primeira-Instancia"
  }
}

resource "aws_eip" "ip_ec2_web" {
  instance = aws_instance.web.id
  vpc      = true
}

# ====== OUTPUTS ========== #
output "instance_arn" {
value = aws_instance.web.arn
}

output "instance_ip" {
value = aws_instance.web.public_ip
}

output "elastic_ip" {
value = aws_eip.ip_ec2_web.public_ip
description = "IP Publico criado o EIP"
}
