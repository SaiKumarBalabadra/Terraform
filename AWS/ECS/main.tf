resource "aws_vpc" "ecs_vpc" {
    cidr_block = "22.22.0.0/18"
    tags = {
      Name = "ecs_vpc"
    }
}

resource "aws_subnet" "public_subnet" {
    count = 1
    vpc_id = aws_vpc.ecs_vpc.id
    cidr_block = "22.22.0.0/19"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
    tags = {
      Name = "ecs_public_subnet"
    }
}

resource "aws_subnet" "private_subnet" {
    count = 1
    vpc_id = aws_vpc.ecs_vpc.id
    cidr_block = "22.22.32.0/19"
    availability_zone = "us-east-1b"
    tags = {
      Name = "ecs_private_subnet"
    }
}

resource "aws_internet_gateway" "ecs_ig" {
    vpc_id = aws_vpc.ecs_vpc.id
    tags = {
      Name = "ecs_igw"
    }
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.ecs_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ecs_ig.id
    }
    tags = {
      Name = "public_rt"
    }
}

resource "aws_route_table_association" "rt_igw" {
  count = 1
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}