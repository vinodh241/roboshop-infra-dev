resource "aws_ssm_parameter" "frontend_sg_id" {
  name = "/${var.project}/${var.environment}/frontend_sg_id"
  type  = "String"
  value = module.frontend_sg_id
}