terraform {
  cloud {
    organization = "amreshsharma"

    workspaces {
      name = "env-dev-prometheus"
    }
  }
}