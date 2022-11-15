resource "kubernetes_namespace_v1" "module-ns" {
    metadata {
      name = var.module-ns
    }
}

resource "kubernetes_config_map_v1" "test-config" {
  metadata {
    name = "test-config"
    namespace = var.module-ns
  }
  data = {
    "test-key" = var.module-data
  }
  depends_on = [
    kubernetes_namespace_v1.module-ns
  ]
}