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
