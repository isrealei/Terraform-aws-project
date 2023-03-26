variable "REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0557a15b87f6559cf"
    us-east-2 = "ami-0d2017e886fc2c0ab"
  }
}

variable "PRIV_KEY_PATH" {
  default = "delightkey"
}

variable "PUB_KEY_PATH" {
  default = "delightkey.pub"
}

variable "USERNAME" {
  default = "ubuntu"
}

variable "MYIP" {
  default = "92.40.167.173"
}

variable "rmquser" {
  default = "rabbit"
}

variable "rmqpass" {
  default = "76932072issR$"
}

variable "dbuser" {
  default = "admin"
}

variable "dbpass" {
  default = "76932072issR$"
}

variable "dbname" {
  default = "account"
}

variable "instance_count" {
  default = "1"
}

variable "VPC_NAME" {
  default = "DELPRO-VPC"

}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}

variable "vpc_CIDR" {
  default = "172.21.0.0/16"
}


variable "pubSub1CIDR" {
  default = "172.21.1.0/24"
}

variable "pubSub2CIDR" {
  default = "172.21.2.0/24"
}

variable "pubSub3CIDR" {
  default = "172.21.3.0/24"
}

variable "privSub1CIDR" {
  default = "172.21.4.0/24"
}

variable "privSub2CIDR" {
  default = "172.21.5.0/24"
}

variable "privSub3CIDR" {
  default = "172.21.6.0/24"
}