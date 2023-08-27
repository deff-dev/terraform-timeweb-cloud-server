servers = {
  server_with_preset = {
    location      = "ru-1",
    cpu_frequency = 3.3,
    disk_type     = "nvme",
    preset = {
      cpu  = 1
      ram  = 1
      disk = 15

      price = {
        min = 100
        max = 200
      }
    }
    os = {
      name    = "ubuntu"
      version = "22.04"
    }
    ssh_keys = ["key_name_1", "key_name_2"]
  }
  server_with_configurator = {
    location      = "ru-1",
    cpu_frequency = 3.3,
    disk_type     = "nvme",
    configurator = {
      cpu  = 1
      ram  = 4
      disk = 5
    }
    os = {
      name    = "ubuntu"
      version = "22.04"
    }
  }
}
