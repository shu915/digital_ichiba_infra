resource "aws_subnet" "public_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "digital-ichiba-subnet-public-1a"
  }
}

resource "aws_subnet" "public_1c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "digital-ichiba-subnet-public-1c"
  }
}

resource "aws_subnet" "private_1a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.30.0/24"
  availability_zone = "ap-northeast-1a"
  tags = {
    Name = "digital-ichiba-subnet-private-1a"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.40.0/24"
  availability_zone = "ap-northeast-1c"
  tags = {
    Name = "digital-ichiba-subnet-private-1c"
  }
}
