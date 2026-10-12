resource "harness_platform_gitops_agent" "gitops_agent" {
  identifier = var.agent_identifier
  account_id = var.account_id
  project_id = var.project_id
  org_id     = var.org_id
  name       = var.agent_name
  type       = "MANAGED_ARGO_PROVIDER"
  metadata {
    namespace         = var.agent_namespace
    high_availability = false
  }
}

data "harness_platform_gitops_agent_deploy_yaml" "gitops_agent_yaml" {
  identifier = harness_platform_gitops_agent.gitops_agent.identifier
  account_id = var.account_id
  project_id = var.project_id
  org_id     = var.org_id
  namespace  = var.agent_namespace
}

# The generated manifest contains the agent's credentials and is gitignored.
resource "local_file" "gitops_agent_yaml_file" {
  filename = "${path.module}/gitops_agent.yaml"
  content  = jsondecode(data.harness_platform_gitops_agent_deploy_yaml.gitops_agent_yaml.yaml)["value"]
}

resource "null_resource" "deploy_agent_resources_to_cluster" {
  triggers = {
    manifest     = local_file.gitops_agent_yaml_file.filename
    content_hash = sha256(local_file.gitops_agent_yaml_file.content)
  }

  provisioner "local-exec" {
    when    = create
    command = "kubectl apply -f ${self.triggers.manifest} && sleep 60"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "kubectl delete --ignore-not-found -f ${self.triggers.manifest}"
  }
}
