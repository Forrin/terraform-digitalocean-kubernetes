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

variable "ha" {
  type = bool
  description = "Enable high availability control plane."
  default = true
}

variable "default_node_pool" {
  type = object({
    name       = string
    size       = string
    node_count = number
    auto_scale = bool
    min_nodes = number
    max_nodes = number
    tags = list(string)
    labels = map(string)
  })

  description = "Cluster default node pool."
  default = {
    auto_scale = true
    # labels = {
    #   "key" = "value"
    # }
    max_nodes = 2
    min_nodes = 1
    name = "default-node-pool"
    node_count = 1
    size = "s-1vcpu-2gb"
    # tags = [ "value" ]
  }
}

variable "node_pools" {
  type = map(
    object({
      name       = string
      size       = string
      node_count = number
      auto_scale = bool
      min_nodes = number
      max_nodes = number
      tags = list(string)
      labels = map(string)
    })
  )

  description = "Cluster additional node pools."
  default     = {}
}
