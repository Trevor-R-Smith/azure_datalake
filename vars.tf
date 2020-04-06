####################
#
###################

locals{
tags = {
 environment = var.environment
}

}

variable "environment"{
  type = string
  default = "AppDev"
}

####################
#  SQL DATABASE/ SERVER
####################

variable "sql_adminstrator_login" {
  type = string
  description = ""

}
variable "sql_adminstrator_login_password" {
  type = string
  description = ""
}

variable "sql_server_version" {
type = string
description = ""
default = "12.0"
}
##############################
# SQL SYNAPSE DATAWAREHOUSE
#############################

variable "collation" {
  type = string
  description = ""
  default = "SQL_LATIN1_GENERAL_CP1_CI_AS"
}

variable "synapse_skuName" {
 type = string
  description = ""
  default = "DW100c"
}

