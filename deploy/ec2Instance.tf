resource "aws_instance" "app_server" {
  ami           = "ami-083be5f3d791a6e2c"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}