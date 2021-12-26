resource "helm_release" "metrics_server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  version    = "3.7.0"

  namespace        = "monitoring"
  create_namespace = true
}

resource "helm_release" "grafana_prometheus" {
  name       = "prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "22.0.0"

  namespace        = "monitoring"
  create_namespace = true

  values = [
    "${file("values/grafana-prometheus.yaml")}"
  ]
}

resource "helm_release" "loki" {
  name       = "loki"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"
  version    = "2.5.0"

  namespace        = "loki"
  create_namespace = true

  values = [
    "${file("values/loki.yaml")}"
  ]
}

resource "helm_release" "falco" {
  name       = "falco"
  repository = "https://falcosecurity.github.io/charts"
  chart      = "falco"
  version    = "1.16.2"

  namespace        = "falco"
  create_namespace = true

  values = [
    "${file("values/falco.yaml")}"
  ]
}

resource "helm_release" "falco_exporter" {
  name       = "falco-exporter"
  repository = "https://falcosecurity.github.io/charts"
  chart      = "falco-exporter"
  version    = "0.6.2"

  namespace        = "falco"
  create_namespace = true

  values = [
    "${file("values/falco-exporter.yaml")}"
  ]
}

# resource "helm_release" "vcluster" {
#   name       = "vcluster"
#   repository = "https://charts.loft.sh"
#   chart      = "vcluster"
#   version    = "0.4.5"

#   namespace        = "vcluster"
#   create_namespace = true

#   values = [
#     "${file("values/vcluster.yaml")}"
#   ]
# }
