variable "module_ns" {
  type = string
  default = "module-default"
}

resource "kubernetes_config_map_v1" "test-config" {
  metadata {
    name = "test-config"
    namespace = var.module_ns
  }
  data = {
    "test-key" = "test-content"
  }
}