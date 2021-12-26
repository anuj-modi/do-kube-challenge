resource "digitalocean_project" "challenge" {
  name    = "Kubernetes Challenge"
  purpose = "Class project / Educational purposes"
}

data "digitalocean_kubernetes_versions" "doks" {
  version_prefix = "1.21."
}

resource "digitalocean_kubernetes_cluster" "doks" {
  name          = "challenge-cluster"
  region        = "nyc3"
  auto_upgrade  = true
  surge_upgrade = false
  version       = data.digitalocean_kubernetes_versions.doks.latest_version

  maintenance_policy {
    start_time = "00:00"
    day        = "any"
  }

  node_pool {
    name       = "challenge-cluster-pool"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}
