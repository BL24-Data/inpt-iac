resource "aws_security_group" "web" {
  name        = "${var.project_name}-${var.environment}-web-sg"
  description = "Security group serveurs web"
  vpc_id      = var.vpc_id
  tags        = { Name = "${var.project_name}-${var.environment}-web-sg", Role = "web" }
}

resource "aws_security_group" "app" {
  name        = "${var.project_name}-${var.environment}-app-sg"
  description = "Security group serveurs app"
  vpc_id      = var.vpc_id
  tags        = { Name = "${var.project_name}-${var.environment}-app-sg", Role = "app" }
}

resource "aws_instance" "web" {
  count         = 1
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids[0]
  tags          = { Name = "${var.project_name}-${var.environment}-web-${count.index}", Role = "web", environment = var.environment }
}

resource "aws_instance" "app" {
  count         = 2
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids[count.index % length(var.subnet_ids)]
  tags          = { Name = "${var.project_name}-${var.environment}-app-${count.index}", Role = "app", environment = var.environment }
}