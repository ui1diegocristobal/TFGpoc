output "kubernetes_cluster_output" {
  value = civo_kubernetes_cluster.main-cluster.master_ip
}


resource "local_file" "kubeconfig" {
    content  = civo_kubernetes_cluster.main-cluster.kubeconfig
    filename = "kubeconfig"
    depends_on = [
    civo_kubernetes_cluster.main-cluster,
  ]
}