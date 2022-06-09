# Digitalocean Terraform Kubernetes Module

This module deploys a Kubernetes cluster on Digital Ocean Cloud.

# Usage

```hcl
module "k8s" {
  source = "github.com/Forrin/terraform-digitalocean-kubernetes"

  cluster_name = "demo-cluster"
  region       = "nyc1"
  ha = false
  default_node_pool = {
    name       = "demo-node"
    size       = "s-1vcpu-2gb"

    node_count = null

    auto_scale = true
    max_nodes = 2 # must set when auto_scale is true
    min_nodes = 1 # must set when auto_scale is true

    labels = { "cluster" = "demo" }
    tags = [ "demo" ]
  }

  node_pools = {
    "01" = {
      name = "addl-pool-1"
      size       = "s-1vcpu-2gb"

      node_count = 1

      auto_scale = false
      max_nodes = null
      min_nodes = null

      labels = { "cluster" = "demo" }
      tags = [ "demo" ]
    }
  }
}
```
