variable cities {
  type        = list
  default     = []
  description = "List of cities"
}

variable departments {
  type        = list
  default     = []
  description = "List of departments"
}

variable jobTitles {
  type        = list
  default     = []
  description = "List of job titles"
}

variable cidr_block {
  type        = string
  default     = "10.0.0.0/8"
  description = "CIDR main block"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = ""
}

variable "groups" {
  type        = list(any)
  default     = []
  description = "List of CSP groups"
}

variable "domain" {
  type        = string
  default     = ""
}