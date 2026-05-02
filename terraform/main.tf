resource "kind_cluster" "default" {
  name           = "secure-platform-cluster"
  node_image     = "kindest/node:v1.27.3"
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/alphav4"

    node {
      role = "control-plane"
    }
    node {
      role = "worker"
    }
  }

}


resource "kubernetes_namespace_v1" "app_ns" {
  metadata {
    name = "secure-app"
  }

  depends_on = [kind_cluster.default]
}

