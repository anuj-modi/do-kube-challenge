provider "helm" {
  kubernetes {
    host                   = digitalocean_kubernetes_cluster.doks.kube_config[0].host
    token                  = digitalocean_kubernetes_cluster.doks.kube_config[0].token
    cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.doks.kube_config[0].cluster_ca_certificate)
  }
}

provider "digitalocean" {
  token = var.do_token
}
