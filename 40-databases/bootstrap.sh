#!/bin/bash
component=$1

dbf install ansible -y 

ansible-pull -U https://github.com/vinodh241/ansible-roboshop-roles-tf.git -e component=$1 -e env=$2 main.yaml