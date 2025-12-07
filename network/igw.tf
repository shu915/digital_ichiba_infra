resource "aws_internet_gateway" "igw" {
  tags = {
    Name = "digital-ichiba-igw"
  }
}

resource "aws_internet_gateway_attachment" "igw_attach" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.main.id
}