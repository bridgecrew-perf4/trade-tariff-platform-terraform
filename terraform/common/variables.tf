variable "project-key" {
  type        = string
  description = "The project key to use in prefixing resources"
  default     = "trade-tariff"
}


variable "environments" {
  type        = list(any)
  description = "list of environment name keys to use in environment interpolations"
  default     = ["development", "staging", "production"]
}

variable "notification_email" {
  type = string
  description = "Email address from where to send worker reports"
#  default = "no-reply@trade-tariff.service.gov.uk"
  default = "trade-tariff-support@enginegroup.com"
}
