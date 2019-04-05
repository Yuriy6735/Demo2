variable "bucket" {
  description = "my bucket"
//  export TF_VAR_bucket=api_app
}

variable "project" {
  description = "my project"
//  export TF_VAR_project=gcpssproject-235212
}

variable "API" {
  description = "API Key"
//  export TF_VAR_API=688bc3704f60250be00b93ccbdbf7c9b
}

variable "service" {
  description = "service IP address"

}
variable "ip_redis" {
  description = "redis IP"
}

variable "region" {
  default = "europe-west1"

}

variable "MONGODB_DATABASE" {
  default = "mysinoptik"
}

variable "MONGODB_USERNAME" {
  default = "main_admin"
}

variable "MONGODB_PASSWORD" {}
variable "MONGODB_ROOT_PASSWORD" {}