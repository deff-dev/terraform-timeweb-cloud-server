locals {
  preset_id       = try(data.twc_presets.default[0].id, null)
  configurator_id = try(data.twc_configurator.default[0].id, null)
  ssh_keys_ids    = [for key in data.twc_ssh_keys.default : key.id]
}
