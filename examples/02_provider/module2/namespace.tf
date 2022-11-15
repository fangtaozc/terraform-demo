resource "kubernetes_namespace_v1" "module-ns-2" {
    metadata {
      name = "test-module-ns-2"
    }
}