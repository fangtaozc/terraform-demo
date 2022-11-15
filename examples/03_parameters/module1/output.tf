output "module-ns" {
    value = kubernetes_namespace_v1.module-ns.metadata[0].name
}