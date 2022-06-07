# Digitalocean Terraform Kubernetes Module

This module deploys a Kubernetes cluster in Digital Ocean.

# Usage

```
module "k8s" {
  source = "github.com/Forrin/terraform-digitalocean-kubernetes"

  cluster_name = "demo-cluster"
  region       = "nyc1"
  default_node_pool = {
    name       = "demo-node"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}
```
