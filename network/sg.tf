resource "aws_security_group" "alb_sg" {
  name        = "digital-ichiba-sg-alb"
  description = "digital-ichiba-sg-alb"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "digital-ichiba-sg-alb"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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

resource "aws_security_group" "app_sg" {
  name        = "digital-ichiba-sg-app"
  description = "digital-ichiba-sg-app"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "digital-ichiba-sg-app"
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db_sg" {
  name        = "digital-ichiba-sg-db"
  description = "digital-ichiba-sg-db"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "digital-ichiba-sg-db"
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}