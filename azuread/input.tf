variable "cities" {
  type        = list(any)
  default     = []
  description = "List of cities"
}

variable "departments" {
  type        = list(any)
  default     = []
  description = "List of departments"
}

variable "jobTitles" {
  type        = list(any)
  default     = []
  description = "List of job titles"
}

variable "groups" {
  type        = list(any)
  default     = []
  description = "List of CSP groups"
}