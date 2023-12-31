module "server" {
  for_each = var.servers

  source = "../"

  name          = each.key
  os            = each.value.os
  location      = each.value.location
  cpu_frequency = each.value.cpu_frequency
  disk_type     = each.value.disk_type

  preset        = each.value.preset
  configurator = each.value.configurator
  ssh_keys      = each.value.ssh_keys
  cloud_init = each.value.cloud_init
}
