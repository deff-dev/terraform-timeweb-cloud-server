terraform {
  required_version = ">= 1.3"

  required_providers {
    twc = {
      source  = "timeweb-cloud/timeweb-cloud"
      version = ">= 1.1.0"
    }
  }
}
