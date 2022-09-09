resource "aws_instance" "app_server" {
  ami           = "ami-01ce47da86486d7b5"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}