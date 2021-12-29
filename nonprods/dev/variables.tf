variable "env" {
  type = string
}
variable "scriptping" {
  type = string
}

variable "frontdoorname" {
  type = string
}

variable "scriptiis" {
  type = string
}

variable "vmsize" {
  type = string
}

variable "adminname" {
  type    = string
  default = "broadleaf"
}

variable "adminpwd" {
  type    = string
  default = "P@ssword123456"
}

variable "prefix" {
  type = string
}

variable "storage_mb" {
  description = "Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs."
  type        = number
  default     = 102400
}

variable "secret_name" {
  description = "This is the name of the secret within the keyvault"
}

variable "secret_value" {
  type        = string
  description = "Key Vault Secret value in Azure"
}

variable "firewall_rules" {
  description = "The list of maps, describing firewall rules. Valid map items: name, start_ip, end_ip."
  type        = list(map(string))
  default     = []
}

variable "frontdoorlocation" {
  description = "This is the location for the frontdoor"
  type        = string

}

variable "location" {
  type        = string
  description = "Resources location in Azure"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
}

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}

//variable "client_secret" {
//  description = "This is the client secret"
//}
