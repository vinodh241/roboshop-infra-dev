variable "project" {
  default = "roboshop"
}
variable "environment" {
  default = "dev"

}
variable "frontend_sg_name" {
    default = "frontend"
  
}
variable "frontend_sg_description" {
 default = "created sg for frontend instances"
  
}

variable "bastion_sg_name" {
  default = "bastion"
  
}

variable "bastion_sg_description" {
  
  default = "creating sg for bastion instances"
}

variable "backend_alb_sg_name" {
  default = "backend-alb"
  
}

variable "backend_alb_sg_description" {
  
  default = "creating sg for backend-alb  instances"
}

variable "mongodb_ports_vpn" { # just keep as mongodb_ports
    default = [22, 27017]
}

variable "redis_ports_vpn" {
    default = [22, 6379]
}

variable "mysql_ports_vpn" {
    default = [22, 3306]
}

variable "rabbitmq_ports_vpn" {
    default = [22, 5672]
}