resource "digitalocean_kubernetes_cluster" "this" {
  name    = var.cluster_name
  region  = var.region
  version = var.cluster_version

  auto_upgrade = var.auto_upgrade

  node_pool {
    name       = var.default_node_pool.name
    size       = var.default_node_pool.size
    node_count = var.default_node_pool.node_count
  }
}

resource "digitalocean_kubernetes_node_pool" "this" {
  for_each = var.node_pools

  cluster_id = digitalocean_kubernetes_cluster.this.id

  name       = each.value.name
  size       = each.value.size
  node_count = each.value.node_count
}