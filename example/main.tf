module "server" {
  for_each = var.servers

  source = "../"

  name          = each.key
  os            = each.value.os
  location      = each.value.location
  cpu_frequency = each.value.cpu_frequency
  disk_type     = each.value.disk_type

  preset        = each.value.preset
  configuration = each.value.configuration
  ssh_keys      = each.value.ssh_keys
}
