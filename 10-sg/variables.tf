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