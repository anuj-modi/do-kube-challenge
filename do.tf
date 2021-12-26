resource "digitalocean_project" "challenge" {
  name    = "Kubernetes Challenge"
  purpose = "Class project / Educational purposes"
}

data "digitalocean_kubernetes_versions" "doks" {
  version_prefix = "1.21."
}

resource "digitalocean_kubernetes_cluster" "doks" {
  name          = "k8s-1-21-5-do-0-nyc3-1638763498666"
  region        = "nyc3"
  auto_upgrade  = true
  surge_upgrade = false
  version       = data.digitalocean_kubernetes_versions.doks.latest_version

  maintenance_policy {
    start_time = "00:00"
    day        = "any"
  }

  node_pool {
    name       = "pool-ou76lq063"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}
