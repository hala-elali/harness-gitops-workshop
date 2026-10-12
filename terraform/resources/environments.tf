resource "harness_platform_environment" "gitops_dev_env" {
  identifier = "dev"
  name       = "dev"
  org_id     = var.org_id
  project_id = var.project_id
  type       = "PreProduction"
  yaml       = <<-EOT
    environment:
      name: dev
      identifier: dev
      description: ""
      tags: {}
      type: PreProduction
      orgIdentifier: ${var.org_id}
      projectIdentifier: ${var.project_id}
      variables: []
  EOT
  depends_on = [harness_platform_gitops_cluster.gitops_cluster]
}

resource "harness_platform_environment_clusters_mapping" "dev_env_cluster_mapping" {
  identifier = var.cluster_identifier
  env_id     = harness_platform_environment.gitops_dev_env.identifier
  org_id     = var.org_id
  project_id = var.project_id
  clusters {
    identifier = harness_platform_gitops_cluster.gitops_cluster.identifier
    name       = var.cluster_name
    scope      = "PROJECT"
  }
}

resource "harness_platform_environment" "gitops_prod_env" {
  identifier = "prod"
  name       = "prod"
  org_id     = var.org_id
  project_id = var.project_id
  type       = "Production"
  yaml       = <<-EOT
    environment:
      name: prod
      identifier: prod
      description: ""
      tags: {}
      type: Production
      orgIdentifier: ${var.org_id}
      projectIdentifier: ${var.project_id}
      variables: []
  EOT
  depends_on = [harness_platform_gitops_cluster.gitops_cluster]
}

resource "harness_platform_environment_clusters_mapping" "prod_env_cluster_mapping" {
  identifier = var.cluster_identifier
  env_id     = harness_platform_environment.gitops_prod_env.identifier
  org_id     = var.org_id
  project_id = var.project_id
  clusters {
    identifier = harness_platform_gitops_cluster.gitops_cluster.identifier
    name       = var.cluster_name
    scope      = "PROJECT"
  }
}
