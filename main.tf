locals {
  preset_id       = try(data.twc_presets.default[0].id, null)
  project_id      = try(data.twc_projects.default[0].id, null)
  configurator_id = try(data.twc_configurator.default[0].id, null)
  ssh_keys_ids    = concat([for key in data.twc_ssh_keys.default : key.id], [for key in twc_ssh_key.default : key.id])
  cloud_init      = var.cloud_init == null ? "" : templatefile(var.cloud_init.file, local.cloud_init_vars)
  cloud_init_vars = try(var.cloud_init.vars == null ? {} : var.cloud_init.vars, {})
  ssh_keys_paths  = try({ for key, value in var.ssh_keys_paths : key => value }, null)
}

data "twc_os" "default" {
  name    = var.os.name
  version = var.os.version
}

data "twc_presets" "default" {
  count = var.preset != null ? 1 : 0

  location      = var.location
  cpu_frequency = var.cpu_frequency
  disk_type     = var.disk_type

  cpu  = var.preset.cpu
  ram  = 1024 * var.preset.ram
  disk = 1024 * var.preset.disk

  dynamic "price_filter" {
    for_each = var.preset.price == null ? [] : [var.preset.price]

    content {
      from = price_filter.value.min
      to   = price_filter.value.max
    }
  }
}

data "twc_ssh_keys" "default" {
  for_each = var.ssh_keys == null ? [] : toset(var.ssh_keys)

  name = each.key
}

data "twc_configurator" "default" {
  count = var.configurator != null ? 1 : 0

  location      = var.location
  cpu_frequency = var.cpu_frequency
  disk_type     = var.disk_type
}

data "twc_projects" "default" {
  count = var.project_name != null ? 1 : 0
  name  = var.project_name
}

resource "twc_ssh_key" "default" {
  count = local.ssh_keys_paths != null ? length(local.ssh_keys_paths) : 0

  name = local.ssh_keys_paths[count.index].name
  body = file(local.ssh_keys_paths[count.index].path)
}

resource "twc_server" "default" {
  name = var.name

  preset_id = local.preset_id

  os_id = data.twc_os.default.id
  os_id      = data.twc_os.default.id
  project_id = local.project_id

  ssh_keys_ids = local.ssh_keys_ids

  cloud_init = local.cloud_init

  dynamic "configuration" {
    for_each = var.configurator == null ? [] : [var.configurator]

    content {
      configurator_id = local.configurator_id

      cpu  = configuration.value.cpu
      ram  = 1024 * configuration.value.ram
      disk = 1024 * configuration.value.disk
    }
  }

  lifecycle {
    ignore_changes = [ssh_keys_ids]
  }
}
