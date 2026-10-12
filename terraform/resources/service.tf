resource "harness_platform_service" "gitops_service" {
  identifier  = var.service_name
  name        = var.service_name
  description = var.service_name
  org_id      = var.org_id
  project_id  = var.project_id
  yaml        = <<-EOT
    service:
      name: ${var.service_name}
      identifier: ${var.service_name}
      orgIdentifier: ${var.org_id}
      projectIdentifier: ${var.project_id}
      serviceDefinition:
        spec:
          manifests:
            - manifest:
                identifier: configjson
                type: ReleaseRepo
                spec:
                  store:
                    type: Github
                    spec:
                      connectorRef: account.${harness_platform_connector_github.github_appset_repo_connector.identifier}
                      gitFetchType: Branch
                      paths:
                        - configs/git-generator-files-discovery/cluster-config/engineering/<+env.name>/config.json
                      branch: main
            - manifest:
                identifier: podinfodeployment
                type: DeploymentRepo
                spec:
                  store:
                    type: Github
                    spec:
                      connectorRef: account.${harness_platform_connector_github.github_appset_repo_connector.identifier}
                      gitFetchType: Branch
                      paths:
                        - configs/git-generator-files-discovery/git-generator-files.yaml
                      branch: main
        type: Kubernetes
      gitOpsEnabled: true
  EOT
  depends_on  = [harness_platform_gitops_cluster.gitops_cluster]
}
