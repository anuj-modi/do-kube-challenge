terraform {
  cloud {
    organization = "anuj-modi"

    workspaces {
      name = "do-kube-challenge"
    }
  }


  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    helm = {
      version = "~> 2.0"
    }
  }
}
