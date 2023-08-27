terraform {
  required_version = ">= 1.0"

  required_providers {
    twc = {
      source  = "timeweb-cloud/timeweb-cloud"
      version = ">= 0.0.14"
    }
  }
}
