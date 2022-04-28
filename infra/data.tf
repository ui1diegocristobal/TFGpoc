# Data haciendo una consulta de que tipo de instancia asignaremos a los nodos del cluster
data "civo_size" "xsmall" {
    filter {
        key = "name"
        values = ["xsmall"]
        match_by = "re"
    }

    filter {
        key = "type"
        values = ["instance"]
    }

}