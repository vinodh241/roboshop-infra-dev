module "frontend" {
    source = "../../terraform-aws-securitygroup"    # here i gave the naming convention like = 10 ( one and zero ) maybe feature if any other wil come so then 20( two zero)

    project = var.project
    environment = var.environment
    sg_name = var.frontend_sg_name
    sg_description = var.frontend_sg_description
    vpc_id = local.vpc_id

}