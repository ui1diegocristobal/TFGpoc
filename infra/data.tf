# Data haciendo una consulta de que tipo de instancia asignaremos a los nodos del cluster
data "civo_size" "instance" {
    filter {
        key = "name"
        values = [var.instance_type]
        match_by = "re"
    }

    filter {
        key = "type"
        values = ["instance"]
    }

}