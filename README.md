<h1 align="center">  TimeWeb-Cloud Server Terraform module  </h1>


<div align="center">

![Downloads](https://img.shields.io/github/downloads/deff-dev/terraform-timeweb-server/total.svg
)
![Release](https://img.shields.io/github/v/release/deff-dev/terraform-timeweb-server)
![Forks](https://img.shields.io/github/forks/deff-dev/terraform-timeweb-server)
![Stars](https://img.shields.io/github/stars/deff-dev/terraform-timeweb-server)
![License](https://img.shields.io/github/license/deff-dev/terraform-timeweb-server)

</div>


## 📝 Table of Contents

- [About](#about)
- [Usage](#usage)
- [Example](#example)
- [Notes](#notes)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)
- [Authors](#authors)
- [License](#license)

## 🧐 About <a name = "about"></a>
Terraform module which creates server on TimeWeb Cloud

## 🎈 Usage <a name = "usage"></a>

### Single server
```hcl
#
# With preset
#

module "server" {
  source = "git@github.com:deff-dev/terraform-timeweb-server.git"

  name = "Single-preset"
  os = {
    name    = "ubuntu"
    version = "22.04"
  }
  location      = "ru-1"
  cpu_frequency = 3.3
  disk_type     = "nvme"

  preset = {
    cpu  = 1
    ram  = 1
    disk = 15

    price = {
      min = 100
      max = 200
    }
  }

  ssh_keys = ["key_name_1", "key_name_2"]
}
```

```hcl
#
# With configuration
#

module "server" {
  source = "git@github.com:deff-dev/terraform-timeweb-server.git"

  name = "Single-configuration"
  os = {
    name    = "ubuntu"
    version = "22.04"
  }
  location      = "ru-1"
  cpu_frequency = 3.3
  disk_type     = "nvme"

  configuration = {
    cpu  = 1
    ram  = 4
    disk = 5
  }

  ssh_keys = ["key_name_1", "key_name_2"]
}
```

## 😊 Example <a name = "example"></a>

- [Multiple server](https://github.com/deff-dev/terraform-timeweb-server/tree/main/example)

## 📝 Notes <a name = "notes"></a>

- Can select only [preset](https://github.com/deff-dev/terraform-timeweb-server#input_preset) or [configuration](https://github.com/deff-dev/terraform-timeweb-server#input_configuration) for one server

## 📋 Requirements <a name = "requirements"></a>

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](https://www.terraform.io/) | >= 1.0 |
| <a name="requirement_timeweb-cloud"></a> [timeweb-cloud](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/) | >= 0.0.14 |

## ☁️ Providers <a name = "providers"></a>

| Name | Version |
|------|---------|
| <a name="provider_timeweb-cloud"></a> [timeweb-cloud](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/) | >= 0.0.14 |

## 📦 Modules <a name = "modules"></a>

No modules.

## 🌐 Resources <a name = "resources"></a>

| Name | Type |
|------|------|
| [twc_server.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/resources/server) | resource |
| [twc_os.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/data-sources/os) | data source |
| [twc_presets.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/data-sources/presets) | data source |
| [twc_configurator.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/data-sources/configurator) | data source |
| [twc_ssh_keys.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/data-sources/ssh_keys) | data source |

## 📥 Inputs <a name = "inputs"></a>

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name for server | `string` | `"Managed by terraform"` | yes |
| <a name="input_os"></a> [os](#input\_os) | Information about specified OS | `object` | `null` | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for the server (ru-1, ru-2, pl-1, kz-1)| `string` | `null` | no |
| <a name="input_cpu_frequency"></a> [cpu\_frequency](#input\_cpu\_frequency) | Current CPU frequency of server (2.8, 3.3, 5) | `number` | `3.3` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk_\type) | Disk type for the created server (ssd, nvme, hdd) | `string` | `null` | no |
| <a name="input_preset"></a> [preset](#input\_preset) | Settings for the server with preset | `object` | `null` | no |
| <a name="input_configuration"></a> [configuration](#input\_configuration) | Settings for the server with configuration | `object` | `null` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | List of names SSH Keys for server | `list(string)` | `null` | no |

## 📤 Outputs <a name = "outputs"></a>

| Name | Description |
|------|-------------|
| <a name="output_server_network"></a> [server_network](#output\_server\_network) | Return all information about server network |
| <a name="output_server_public_ip"></a> [server_public_ip](#output\_server\_public\_ip) | Return server public IP |
| <a name="output_server_name"></a> [server_name](#output\_server\_name) | Return server name |
| <a name="output_server_id"></a> [server_id](#output\_server\_id) | Return server id |

## ✍️ Authors <a name = "authors"></a>

Module is maintained by [Deff](https://github.com/deff-dev). <br>
Thanks for help [alxrem](https://github.com/alxrem).

## 🔑 License <a name = "license"></a>

Apache 2 Licensed. See [LICENSE](https://github.com/deff-dev/terraform-timeweb-server/blob/main/LICENSE) for full details.
