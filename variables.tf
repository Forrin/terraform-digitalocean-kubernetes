variable "cluster_name" {
  type        = string
  description = "K8s Cluster Name."
}

variable "region" {
  type        = string
  description = "K8s Cluster Region."
}

variable "cluster_version" {
  type        = string
  description = "K8s Cluster Version."
  default     = "1.22.8-do.1"
}

variable "auto_upgrade" {
  type        = bool
  description = "Enable auto upgrade during maintenance window."
  default     = true
}

variable "surge_upgrade" {
  type        = bool
  description = "Enable surge upgrade during maintenance window."
  default     = true
}

variable "default_node_pool" {
  type = object({
    name       = string
    size       = string
    node_count = number
  })

  description = "Cluster default node pool."
}

variable "node_pools" {
  type = map(
    object({
      name       = string
      size       = string
      node_count = number
    })
  )

  description = "Cluster additional node pools."
  default     = {}
}
