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
