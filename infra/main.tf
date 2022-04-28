# Crea un cluster en CIVO
resource "civo_kubernetes_cluster" "main-cluster" {
    name = "tfg-cluster"
    firewall_id = civo_firewall.my-firewall.id
    pools {
        size = element(data.civo_size.xsmall.sizes, 0).name
        node_count = 3
    }
}