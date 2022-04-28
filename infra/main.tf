# Crea un firewall
resource "civo_firewall" "my-firewall" {
    name = "my-firewall"
}

# Crea una regla de firewall admitiendo el trafico en el endpoint de la api de k8s
resource "civo_firewall_rule" "kubernetes" {
    action = "allow"
    firewall_id = civo_firewall.my-firewall.id
    protocol = "tcp"
    start_port = "6443"
    end_port = "6443"
    cidr = ["0.0.0.0/0"]
    direction = "ingress"
    label = "kubernetes-api-server"
}

# Crea un cluster en CIVO
resource "civo_kubernetes_cluster" "main-cluster" {
    name = "tfg-cluster"
    firewall_id = civo_firewall.my-firewall.id
    pools {
        size = element(data.civo_size.xsmall.sizes, 0).name
        node_count = 3
    }
}