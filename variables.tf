variable "name" {
  description = "Server name"
  type        = string
  default     = "Managed by terraform"
}

variable "os" {
  description = "Information about specified OS"

  type = object({
    name    = string
    version = string
  })

  default = {
    name    = "ubuntu"
    version = "22.04"
  }
}

variable "ssh_keys" {
  description = "List of names SSH Keys for server"
  type        = list(string)
  default     = null
}

variable "location" {
  description = "Location for the server (ru-1, ru-2, pl-1, kz-1)"
  type        = string
  default     = null
}

variable "cpu_frequency" {
  description = "Current CPU frequency of server (2.8, 3.3, 5)"
  type        = number

  validation {
    condition     = contains([2.8, 3.3, 5], var.cpu_frequency)
    error_message = "Error! CPU frequency does not support"
  }
  default = 3.3
}

variable "disk_type" {
  description = "Disk type for the created server (ssd, nvme, hdd)"
  type        = string
  default     = null
}

variable "preset" {
  description = "Settings for the server with preset"

  type = object({
    cpu  = number
    ram  = number
    disk = number

    price = optional(object({
      min = number
      max = number
    }))
  })

  default = null
}

variable "configurator" {
  description = "Settings for the server with configurator"

  type = object({
    cpu  = number
    ram  = number
    disk = number
  })

  default = null
}
