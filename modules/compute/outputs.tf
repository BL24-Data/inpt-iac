output "web_sg_id" { value = aws_security_group.web.id }
output "app_sg_id" { value = aws_security_group.app.id }
output "web_instance_ids" { value = aws_instance.web[*].id }
output "app_instance_ids" { value = aws_instance.app[*].id }