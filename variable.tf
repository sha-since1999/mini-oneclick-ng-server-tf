variable "keyname" {
  type        = string
  default     = "tf-key"
  description = "Enter key name for key pair"
}
variable "profile" {
  type        = string
  default     = "play"
  description = "Enter the aws profie name"
}
variable "region" {
  default = "us-east-1"
}
variable "ports" {
  type        = list(any)
  description = "enter the list of port "
}
