data "aws_vpc" "default" {
  default = true
}
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
resource "aws_security_group" "ec2_sg" {
  name   = "ec2-sg"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "hamza" {
  ami                         = var.ami_id
  region                      = "eu-west-1"
  instance_type               = var.instance_type
  count                       = 1
  key_name                    = aws_key_pair.hamza.key_name
  subnet_id                   = data.aws_subnets.default.ids[0]
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "Hamza.dev"
    environment = var.environment
  }
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
  }
}
resource "aws_key_pair" "hamza" {
  key_name   = var.keypair_name
  public_key = file("C:/Users/Hamza/.ssh/id_ed25519.pub")
}

