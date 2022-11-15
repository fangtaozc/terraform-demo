resource "kubernetes_namespace_v1" "module-ns-1" {
    metadata {
      name = "test-module-ns-1"
    }
}