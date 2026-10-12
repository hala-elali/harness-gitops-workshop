resource "harness_platform_gitops_applications" "podinfo" {
  application {
    metadata {
      annotations = {}
      labels = {
        "harness.io/serviceRef" = var.service_name
        "harness.io/envRef"     = var.env_name
      }
    name = "podinfo"
    }
    spec {
      sync_policy {
        automated {
          allow_empty = true
        }
        sync_options = [
          "PrunePropagationPolicy=undefined",
          "CreateNamespace=false",
          "Validate=false",
          "skipSchemaValidations=false",
          "autoCreateNamespace=false",
          "pruneLast=false",
          "applyOutofSyncOnly=false",
          "Replace=false",
          "retry=true"
        ]
      }
      source {
        target_revision = "main"
        repo_url        = var.repo_url
        path            = "configs/git-generator-files-discovery"

      }
      destination {
        namespace = var.agent_namespace
        server    = "https://kubernetes.default.svc"
      }
    }
  }
  project_id = var.project_id
  org_id     = var.org_id
  account_id = var.account_id
  identifier = "podinfoappset"
  cluster_id = harness_platform_gitops_cluster.gitops_cluster.identifier
  repo_id    = harness_platform_gitops_repository.gitops_repo.identifier
  agent_id   = harness_platform_gitops_agent.gitops_agent.identifier
  name       = "podinfoappset"
  depends_on = [harness_platform_service.gitops_service]
}
