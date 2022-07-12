variable "project_id" {
  description = "The project to deploy to, if not set the default provider project is used."
  default     = ""
}

variable "role" {
  description = "Role for the account"
  type        = string
}

variable "member" {
  description = "Service Account"
  type        = string
}