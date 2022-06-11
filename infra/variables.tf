variable "civo_token" {
    description = "Token de Civo para autenticar contra la API"
}

variable cluster_name {
    description = "Nombre del cluster"
    default = "cluster_tf"
}

variable instance_type {
    description = "Tipo de instancia de los nodos del cluster"
    default = "small"
}

variable node_count {
    description = "Cantidad de nodos del cluster"
    default = "4"
}