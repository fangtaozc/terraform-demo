resource "kubernetes_namespace_v1" "module-ns" {
    metadata {
      name = "test-module-ns"
    }
}