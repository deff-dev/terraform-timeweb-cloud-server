variable "servers" {
  type = map(object({
    location      = optional(string)
    cpu_frequency = optional(number)
    disk_type     = optional(string)
    preset = optional(object({
      cpu  = number
      ram  = number
      disk = number

      price = optional(object({
        min = number
        max = number
      }))
    }))

    os = object({
      name    = string
      version = string
    })

    ssh_keys = optional(list(string))

    ssh_keys_paths = optional(list(object({
      name = string
      path = string
    })))
    cloud_init = optional(object({
      file = string
      vars = optional(map(string))
    }))

    configurator = optional(object({
      cpu  = number
      ram  = number
      disk = number
    }))
  }))

  default = {}
}

variable "timeweb_token" {
  description = "TimeWebCloud Token"
  type        = string
  nullable    = true
  default     = null
}
