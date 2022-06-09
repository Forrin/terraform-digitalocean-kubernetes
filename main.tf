resource "digitalocean_kubernetes_cluster" "this" {
  name    = var.cluster_name
  region  = var.region
  version = var.cluster_version

  auto_upgrade  = var.auto_upgrade
  surge_upgrade = var.surge_upgrade
  ha            = var.ha

  node_pool {
    name       = var.default_node_pool.name
    size       = var.default_node_pool.size
    node_count = var.default_node_pool.node_count
    auto_scale = var.default_node_pool.auto_scale
    min_nodes  = var.default_node_pool.min_nodes
    max_nodes  = var.default_node_pool.max_nodes
    tags       = var.default_node_pool.tags
    labels     = var.default_node_pool.labels
  }

  dynamic "maintenance_policy" {
    for_each = var.auto_upgrade ? [1] : []
    content {
      day        = var.maintenance_policy.day
      start_time = var.maintenance_policy.start_time
    }
  }

  tags = var.tags
}

resource "digitalocean_kubernetes_node_pool" "this" {
  for_each = var.node_pools

  cluster_id = digitalocean_kubernetes_cluster.this.id

  name       = each.value.name
  size       = each.value.size
  node_count = each.value.node_count
  auto_scale = var.default_node_pool.auto_scale
  min_nodes  = var.default_node_pool.min_nodes
  max_nodes  = var.default_node_pool.max_nodes
  tags       = var.default_node_pool.tags
  labels     = var.default_node_pool.labels
}
