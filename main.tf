resource "aws_vpc" "main" {
  cidr_block       = var.vpccidr
  
  enable_dns_hostnames = true
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.pubsubnetcidr
  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.privsubnetcidr

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_security_group" "samplesg" {
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "samplesg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.samplesg.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_s3_bucket" "terrabucket" {
  bucket = "thisisjustatestucket"
}

resource "aws_db_instance" "terradb" {
  allocated_storage = 10
  db_name = "mydb"
  engine = "postgres"
  engine_version = "17.2"
  instance_class = "db.t3.micro"
  username = "foo"
  password = "foobarbaz"
  skip_final_snapshot = "true"
}

resource "aws_instance" "terrainstance" {
  ami = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"

  tags = {
    Name = "terrainstance"
  }
}