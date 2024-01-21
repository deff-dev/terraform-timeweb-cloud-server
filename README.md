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
  source = "https://github.com/deff-dev/terraform-timeweb-cloud-server.git"

  name         = "Single-preset"
  project_name = "Общий проект"
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

  ssh_keys_paths = [
    {
      name = "key1"
      path = "/local/path/to/key1.pub"
    },
    {
      name = "key2"
      path = "/local/path/to/key2.pub"
    }
  ]

  cloud_init = {
    file = "cloud_init.tftpl"
    vars = {
      package_web = "nginx"
      php_version = 8.2
    }
  }

  providers = {
    twc = twc.default
  }
}

provider "twc" {
  token = "token"
  alias = "default"
}
```

```hcl
#
# With configurator
#

module "server" {
  source = "https://github.com/deff-dev/terraform-timeweb-cloud-server.git"

  name         = "Single-configurator"
  project_name = "Общий проект"
  os = {
    name    = "ubuntu"
    version = "22.04"
  }
  location      = "ru-1"
  cpu_frequency = 3.3
  disk_type     = "nvme"

  configurator = {
    cpu  = 1
    ram  = 4
    disk = 5
  }

  ssh_keys = ["key_name_1", "key_name_2"]

  ssh_keys_paths = [
    {
      name = "key1"
      path = "/local/path/to/key1.pub"
    },
    {
      name = "key2"
      path = "/local/path/to/key2.pub"
    }
  ]

  cloud_init = {
    file = "cloud_init.tftpl"
    vars = {
      package_web = "nginx"
      php_version = 8.2
    }
  }

  providers = {
    twc = twc.default
  }
}

provider "twc" {
  token = "token"
  alias = "default"
}
```

## 😊 Example <a name = "example"></a>

- [Multiple server](https://github.com/deff-dev/terraform-timeweb-server/tree/main/example)

## 📝 Notes <a name = "notes"></a>

- Can select only [preset](https://github.com/deff-dev/terraform-timeweb-server#input_preset) or [configurator](https://github.com/deff-dev/terraform-timeweb-server#input_configurator) for one server

## 📋 Requirements <a name = "requirements"></a>

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](https://www.terraform.io/) | >= 1.3 |
| <a name="requirement_timeweb-cloud"></a> [timeweb-cloud](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/) | >= 1.1.0 |

## ☁️ Providers <a name = "providers"></a>

| Name | Version |
|------|---------|
| <a name="provider_timeweb-cloud"></a> [timeweb-cloud](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/) | >= 1.1.0 |

## 📦 Modules <a name = "modules"></a>

No modules.

## 🌐 Resources <a name = "resources"></a>

| Name | Type |
|------|------|
| [twc_server.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/resources/server) | resource |
| [twc_ssh_key.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/resources/ssh_key) | resource |
| [twc_os.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/data-sources/os) | data source |
| [twc_presets.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/data-sources/presets) | data source |
| [twc_configurator.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/data-sources/configurator) | data source |
| [twc_ssh_keys.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/data-sources/ssh_keys) | data source |
| [twc_projects.default](https://registry.terraform.io/providers/timeweb-cloud/timeweb-cloud/latest/docs/data-sources/projects) | data source |

## 📥 Inputs <a name = "inputs"></a>

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_timeweb_token"></a> [timeweb\_token](#input\_timeweb\_token) | TimeWeb Token | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for server | `string` | `"Managed by terraform"` | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of existing project | `string` | `null` | no |
| <a name="input_os"></a> [os](#input\_os) | Information about specified OS | `object` |  <pre>{<br>  "name": "ubuntu",<br>  "version": "22.04" <br>}</pre> | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for the server (ru-1, ru-2, pl-1, kz-1)| `string` | `null` | no |
| <a name="input_cpu_frequency"></a> [cpu\_frequency](#input\_cpu\_frequency) | Current CPU frequency of server (2.8, 3.3, 5) | `number` | `3.3` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk_\type) | Disk type for the created server (ssd, nvme, hdd) | `string` | `null` | no |
| <a name="input_preset"></a> [preset](#input\_preset) | Settings for the server with preset | `object` | `null` | no |
| <a name="input_configurator"></a> [configurator](#input\_configurator) | Settings for the server with configurator | `object` | `null` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | List of names SSH Keys for server | `list(string)` | `null` | no |
| <a name="input_ssh_keys_paths"></a> [ssh\_keys\_paths](#input\_ssh\_keys\_paths) | Local paths of SSH Keys for server | `list(object)` | `null` | no |
| <a name="input_cloud_init"></a> [cloud\_init](#input\_cloud\_init) | Cloud-init script | `object` | `null` | no |

## 📤 Outputs <a name = "outputs"></a>

| Name | Description |
|------|-------------|
| <a name="output_server_network"></a> [server_network](#output\_server\_network) | Return all information about server network |
| <a name="output_server_public_ip"></a> [server_public_ip](#output\_server\_public\_ip) | Return server public IP |
| <a name="output_server_name"></a> [server_name](#output\_server\_name) | Return server name |
| <a name="output_server_id"></a> [server_id](#output\_server\_id) | Return server id |
| <a name="output_server_cloud_init"></a> [server_cloud_init](#output\_server\_cloud\_init) | Return cloud init script |

## ✍️ Authors <a name = "authors"></a>

Module is maintained by [Deff](https://github.com/deff-dev). <br>
Thanks for help [alxrem](https://github.com/alxrem).

## 🔑 License <a name = "license"></a>

Apache 2 Licensed. See [LICENSE](https://github.com/deff-dev/terraform-timeweb-server/blob/main/LICENSE) for full details.
